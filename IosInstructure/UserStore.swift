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

    @Published var users: [User] = [
        .init(id: 1, avatar: "avart 1", name: "test1", company: "test company1", email: "test email1"),
        .init(id: 2, avatar: "avart 2", name: "test2", company: "test company2", email: "test email2"),
        .init(id: 3, avatar: "avart 3", name: "test3", company: "test company3", email: "test email3"),
        .init(id: 4, avatar: "avart 4", name: "test4", company: "test company4", email: "test email4"),
    ]

    func startFetch(interval: TimeInterval) {
        guard timer == nil else {
            print("already started fetch")
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fetch), userInfo: nil, repeats: true)
    }

    @objc func fetch() {
        GithubApi.shared.getUser{[weak self] (response) in
            switch response {
            case .Success(let user):
                self?.users.append(user)
            case .Failure(let error):
                print("fetch error:" + error.localizedDescription)
            }
        }
    }
}
