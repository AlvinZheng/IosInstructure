//
//  GithubError.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation


struct GithubError: Error {
    enum GithubErrorCode: Int {
        case unkown = 0x999
        case urlFormatError = 0x998
    }
    var code: GithubErrorCode
    var message: String

    init(code: GithubErrorCode, message: String) {
        self.code = code
        self.message = message
    }
}
