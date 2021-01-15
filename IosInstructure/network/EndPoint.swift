//
//  Api.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation

//TODO: supplement this
enum HttpMethod {
    case Get
    case Post
    case Delete
}

protocol EndPoint {
    var baseUrl: String { get }
    var function: String { get }
    var method: HttpMethod { get }
    var headers: [String: String?]? { get }
    var parameters: [String: AnyObject]? { get }
    var fullUrl: String {get}
}
