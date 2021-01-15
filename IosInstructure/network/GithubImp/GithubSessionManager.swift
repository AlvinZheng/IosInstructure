//
//  GithubSessionManager.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation

private let myGithubToken = "5e6fc5b307e0cc608ae3c8bc1039fee34f688a2e"

class GithubSessionManager: SessionManager {
    var accessToken: String? = myGithubToken

    func updateToken(newToken: String) {
        accessToken = newToken
    }

    func handleTokenExpire() {
        //TODO:handle token expire
    }
}
