//
//  CallHistory.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation

struct CallHistory: Identifiable {
    var id: UUID

    var timeStamp: TimeInterval
    var url: String
    
    init(time: TimeInterval, url: String) {
        id = UUID()
        timeStamp = time
        self.url = url
    }
}
