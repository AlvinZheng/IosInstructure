//
//  CallHistory+persistent.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/18.
//

import Foundation

extension CallHistory: Storerable {
    typealias C = String

    func encode() -> String? {
        var codecString = "\(self.id.uuidString)"
        codecString.append(",")
        codecString.append("\(self.timeStamp)")
        codecString.append(",")
        codecString.append("\(self.url)")
        return codecString
    }

    init?(from: String){
        let splited = from.split(separator: ",")
        guard splited.count == 3 else {
            return nil
        }
        guard let uuid = UUID.init(uuidString: String(splited[0])),
              let time = TimeInterval(splited[1]) else {
            return nil
        }
        let url = String(splited[2])

        self.init(uid: uuid, time: time, url: url)
    }
}
