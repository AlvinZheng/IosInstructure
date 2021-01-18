//
//  EndpointPersistent.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/18.
//

import Foundation

class EndpointPersistent {

    static let instance: EndpointPersistent = EndpointPersistent()
    private init() {}

    private let filePersistence = FilePersistence<EndpointResult>.init(fileName: "endpointResult")

    func saveEndpointResult(result: EndpointResult) -> Bool{
        return filePersistence.save(obj: result)
    }

    func recoverLast() -> EndpointResult? {
        //only recover 50 or less
        return filePersistence.recover(from: 0, count: 1).first
    }

}
