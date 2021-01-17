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



