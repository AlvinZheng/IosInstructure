//
//  EndpointResult+persistent.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/18.
//

import Foundation
extension EndpointResult: Storerable {
    typealias C = String

    func encode() -> String? {
        var codecString = "\(self.id?.uuidString ?? "")"
        codecString.append(",")
        codecString.append("\(self.currentUserUrl)")
        codecString.append(",")
        codecString.append("\(self.userUrl)")
        codecString.append(",")
        codecString.append("\(self.issuesUrl)")
        return codecString
    }

    init?(from: String){
        let splited = from.split(separator: ",")
        guard splited.count == 4 else {
            return nil
        }
        guard let uuid = UUID.init(uuidString: String(splited[0])) else {
            return nil
        }
        let curUrlString = String(splited[1])
        let userUrl = String(splited[2])
        let issuUrl = String(splited[3])

        self.init(uid: uuid, currentUserUrl: curUrlString, userUrl: userUrl, issuesUrl: issuUrl)
    }
}
