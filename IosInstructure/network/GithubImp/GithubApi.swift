//
//  GithubApi.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

enum GithubEndpoint {
    case endpointTest
    case user
}

extension GithubEndpoint: EndPoint {
    var baseUrl: String {
        return "https://api.github.com/"
    }

    var function: String {
        switch self {
        case .endpointTest:
            return ""
        case .user:
            return "user"
        }
    }

    var method: HttpMethod {
        switch self {
        default:
            return .Get
        }
    }

    var headers: [String : String?]? {
        return nil
    }

    var parameters: [String : AnyObject]? {
        return nil
    }

    var fullUrl: String {
        return baseUrl + function
    }
}


class GithubApi: Api {
    static let shared: GithubApi = GithubApi()

    private let caller: GithubApiCaller

    private override init() {
        caller = GithubApiCaller(sessionManager: GithubSessionManager())
    }

    func getUser(handler: ((Response<User>) -> Void)?) {
        caller.callApi(endpoint: GithubEndpoint.user, mapper: JSONDecodeMapper<User>(), handler: handler)
    }
}
