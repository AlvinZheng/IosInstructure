//
//  SessionManager.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation

//handle session or cokiee
protocol SessionManager {
    var accessToken: String? { get }
    func updateToken(newToken: String)
    func handleTokenExpire()
}


