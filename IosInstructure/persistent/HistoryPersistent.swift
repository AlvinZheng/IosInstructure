//
//  HistoryPersistent.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/18.
//

import Foundation

class HistoryPersistent {
    static let instance: HistoryPersistent = HistoryPersistent()
    private init() {}

    private let filePersistence = FilePersistence<CallHistory>.init(fileName: "callHistory")

    func saveHistory(history: CallHistory) -> Bool{
        return filePersistence.save(obj: history)
    }

    func recoverAll() -> [CallHistory] {
        //only recover 50 or less
        return filePersistence.recover(from: 0, count: 50)
    }

}
