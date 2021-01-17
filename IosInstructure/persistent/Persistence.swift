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
    func decodeFrom(from: C) -> Self?
}

protocol Persistence {
    associatedtype T: Storerable
    typealias C = T.C
    func save(_: T) -> Bool
    func recover(id: T.ID) -> T?
}
