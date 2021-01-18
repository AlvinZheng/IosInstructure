//
//  UserStore.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

final class EndPointResultStore: ObservableObject {
    static let shared: EndPointResultStore = EndPointResultStore()
    private init() {
        loadLastOne()
    }

    private var timer: Timer?

    @Published var results: [EndpointResult] = []

    private func loadLastOne() {
        if let last = EndpointPersistent.instance.recoverLast() {
            print("found last call result")
            DispatchQueue.main.async {[weak self] in
                self?.results.append(last)
            }
        }
    }


    func startFetch(interval: TimeInterval) {
        guard timer == nil else {
            print("already started fetch")
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fetch), userInfo: nil, repeats: true)
    }
    
    func stopFetch() {
        timer?.invalidate()
        timer = nil;
    }

    @objc private func fetch() {
        GithubApi.shared.endPointTest{[weak self] (response) in
            switch response {
            case .Success(let result):
                _ = EndpointPersistent.instance.saveEndpointResult(result: result)
                DispatchQueue.main.async {[weak self] in
                    self?.results.append(result)
                }
            case .Failure(let error):
                print("fetch error:" + error.localizedDescription)
            }
        }
    }
}
