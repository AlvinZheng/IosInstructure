//
//  UserStore.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

final class UserStore: ObservableObject {
    static let shared: UserStore = UserStore()
    private init() {}

    private var timer: Timer?

    @Published var results: [EndpointResult] = [
        EndpointResult.init(currentUserUrl: "test1 current user url", userUrl: "test1 user url", issuesUrl: "test1 issuses url"),
        EndpointResult.init(currentUserUrl: "test2 current user url", userUrl: "test2 user url", issuesUrl: "test2 issuses url"),
        EndpointResult.init(currentUserUrl: "test3 current user url", userUrl: "test3 user url", issuesUrl: "test3 issuses url"),
        EndpointResult.init(currentUserUrl: "test4 current user url", userUrl: "test4 user url", issuesUrl: "test4 issuses url")
    ]

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
                self?.results.append(result)
            case .Failure(let error):
                print("fetch error:" + error.localizedDescription)
            }
        }
    }
}
