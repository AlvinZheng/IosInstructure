//
//  FilePersistence.swift
//  IosInstructure
//
//  Created by 郑青洲 on 2021/1/17.
//

import Foundation

class FilePersistence<T: Storerable>: Persistence {

    func save(obj: T) -> Bool {
        do {
            let writeHandler = try FileHandle(forWritingTo: fileUrl)
            let coded = obj.encode()
            //TODO: not just string
            if let stringCoded = coded as? String,
               let data = (stringCoded + itemSeperator).data(using: .utf8){
                writeHandler.seekToEndOfFile()
                writeHandler.write(data)
                return true
            }
            return false
        } catch {
            print("write failed, error:" + error.localizedDescription)
            return false
        }
//        guard let writeHandler = try? FileHandle(forWritingTo: fileUrl) else {
//            print("write failed, can not create file handle")
//            return false
//        }

    }

    //TODO:
    func recover(id: T.ID) -> T? {
        return nil
    }

    func recover(from: Int, count: Int) -> [T] {
        //TODO: not just string
        guard T.C.Type.self == String.Type.self else {
            print("only implement String to persistent")
            return [T]()
        }

        //TODO: opt
        guard let data = FileManager.default.contents(atPath: fileUrl.path) else {
            return [T]()
        }
        guard let stringValue = String(data: data, encoding: .utf8) else {
            return [T]()
        }

        let items = stringValue.components(separatedBy: itemSeperator)
        var result = items.compactMap { (str) -> T? in
            return T.init(from: str as! T.C)
        }
        //取最新
        result.reverse()
        let to = (from + count < result.count) ? from + count : result.count
        var sliced = Array<T>(result[from..<to])
        //最新的在后面
        sliced.reverse()
        return sliced
    }

    private let itemSeperator: String = "\n"
    private let fileName: String
    private let fileUrl: URL

    //file name without extension
    init(fileName: String) {
        self.fileName = fileName
        let manager = FileManager.default
        let urls = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentUrl = urls.first!
        let persistentPath = documentUrl.appendingPathComponent("persistent", isDirectory: true)
        var isDirectory: ObjCBool = ObjCBool(false)
        let isExist = manager.fileExists(atPath: persistentPath.path, isDirectory: &isDirectory)

        if !isExist {
            do {
                try manager.createDirectory(at: persistentPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("create persistent directory failed: " + error.localizedDescription)
            }
        }
        fileUrl = persistentPath.appendingPathComponent(self.fileName + ".txt")
        createFileIfNeeded(fileUrl: fileUrl)
    }


    private func createFileIfNeeded(fileUrl: URL){
        let manager = FileManager.default
        let exist = manager.fileExists(atPath: fileUrl.path)
        print("file exist : \(exist)")
        if !exist {
            let createSuccess = manager.createFile(atPath: fileUrl.path,contents:nil, attributes:nil)
            print("create file result: \(createSuccess)")
        }

    }
}



