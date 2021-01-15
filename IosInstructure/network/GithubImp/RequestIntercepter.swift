//
//  RequestIntercepter.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

protocol RequestIntercepter {
    func intercept(request: URLRequest)
}


class LogIncepter: RequestIntercepter, ResponseIntercepter {
    func intercept(request: URLRequest) {
        print("reqeust: " + request.debugDescription)
    }

    func intercept(response: URLResponse) {
        print("response:" + response.debugDescription)
    }

}
