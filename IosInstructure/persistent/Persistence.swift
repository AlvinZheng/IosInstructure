//
//  Persistence.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation

protocol Storerable: Identifiable {
    associatedtype C //codec type, eg: String, data, etc, used to save to file, database , coredata, etc.
    func encode() -> C?
    init?(from: C)
}

protocol Persistence {
    associatedtype T: Storerable
    typealias C = T.C
    func save(obj: T) -> Bool
    func recover(id: T.ID) -> T?
    func recover(from: Int, count: Int) -> [T]
}

