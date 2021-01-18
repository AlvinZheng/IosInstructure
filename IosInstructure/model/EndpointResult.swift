//
//  EndpointResult.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation

struct EndpointResult: Identifiable   {
    var id: UUID?
    var currentUserUrl: String
    var userUrl: String
    var issuesUrl: String
    
    init(currentUserUrl: String, userUrl: String, issuesUrl: String) {
        self.id = UUID()
        self.currentUserUrl = currentUserUrl
        self.userUrl = userUrl
        self.issuesUrl = issuesUrl
    }

    init(uid: UUID, currentUserUrl: String, userUrl: String, issuesUrl: String) {
        self.id = UUID()
        self.currentUserUrl = currentUserUrl
        self.userUrl = userUrl
        self.issuesUrl = issuesUrl
    }
}

extension EndpointResult: ModelMapAble {
    init?(data: Data) {
        return nil
    }
    
    init?(string: String) {
        return nil
    }
}
