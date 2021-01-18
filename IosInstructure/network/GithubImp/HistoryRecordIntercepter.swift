//
//  HistoryRecordIntercepter.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation


class HistoryRecordIntercepter: RequestIntercepter {
    func intercept(request: URLRequest) {
        if let urlString = request.url?.absoluteString {
            let time = Date().timeIntervalSince1970
            let history = CallHistory(time: time, url: urlString)
            print("created call history, time: \(time) url: \(urlString)")
            _ = HistoryPersistent.instance.saveHistory(history: history)
        }
    }
}
