//
//  JSONModelMapper.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/14.
//

import Foundation

protocol ModelMapAble: Codable {
    init?(data: Data)
    init?(string: String)
}

class MapError: Error {

}

class ModelMapper<M: ModelMapAble>{
    func map(string: String) throws -> M{
        if let m = M.init(string: string) {
            return m
        } else {
            throw MapError()
        }
    }
    func map(data: Data) throws -> M{
        if let m = M.init(data: data) {
            return m
        } else {
            throw MapError()
        }
    }
}
