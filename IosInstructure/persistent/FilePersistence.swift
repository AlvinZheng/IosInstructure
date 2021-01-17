//
//  FilePersistence.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation

class FilePersistence<T: Storerable>: Persistence {
    
    func save(_: T) -> Bool {
        return false
    }
    
    func recover(id: T.ID) -> T? {
        return nil
    }
    
    
}
