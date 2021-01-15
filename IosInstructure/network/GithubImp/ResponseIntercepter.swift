//
//  ResponseIntercepter.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

protocol ResponseIntercepter {
    func intercept(response: URLResponse)
}
