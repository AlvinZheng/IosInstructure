//
//  ModelMapAble+JSONDecoder.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

class JSONDecodeMapper<M: ModelMapAble>: ModelMapper<M> {
    private let decoder: JSONDecoder

    override func map(string: String) throws -> M{
        if let m = M.init(string: string) {
            return m
        } else {
            throw MapError()
        }
    }
    
    override func map(data: Data) throws -> M{
        let m = try decoder.decode(M.self, from: data)
        //TODO: remove this ,this is an easy way to generate identifier id
        if var endpoint = m as? EndpointResult{
            endpoint.id = UUID()
            return endpoint as! M
        }
        return m
    }

    override init() {
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        decoder = d
        super.init()

    }
}
