//
//  HistoryStore.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/18.
//

import Foundation
final class HistoryStore: ObservableObject {

    static let shared: HistoryStore = HistoryStore()
    private init() {}

    @Published var histories: [CallHistory] = []

    //only load 50 history
    func loadHistory() {
        DispatchQueue.main.async {[weak self] in
            self?.histories = HistoryPersistent.instance.recoverAll()
        }
    }
}



