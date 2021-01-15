//
//  User.swift
//  IosInstructure
//
//  Created by alvin zheng on 2021/1/15.
//

import Foundation

struct User: ModelMapAble, Identifiable  {
    var id: Int
    var avatarUrl: String
    var name: String
    var company: String
    var email: String

    init(id: Int, avatar: String, name: String, company: String, email: String) {
        self.id = id
        self.avatarUrl = avatar
        self.name = name
        self.company = company
        self.email = email
    }
}

extension User {
    init?(data: Data) {
        return nil
    }

    init?(string: String) {
        return nil
    }
}
