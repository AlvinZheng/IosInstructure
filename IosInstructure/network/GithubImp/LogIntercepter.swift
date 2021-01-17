//
//  LogIntercepter.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation

class LogIncepter: RequestIntercepter, ResponseIntercepter {
    func intercept(request: URLRequest) {
        print("reqeust: " + (request.url?.absoluteString ?? "nil url"))
    }

    func intercept(response: URLResponse) {
        print("response:" + (response.url?.absoluteString ?? "nil url"))
    }

}
