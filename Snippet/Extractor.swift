//
//  Extractor.swift
//  Snippet
//
//  Created by Paul on 2017-03-17.
//  Copyright © 2017 Refinery. All rights reserved.
//

import Foundation

class EpubExtractor {
    var snipManager = SnipGenerator()
    var fileSnips = [Snip]()
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func getEpubInfo() {

        let fileManager = FileManager.default
        let usersUrl =  fileManager.urls(for: .userDirectory, in: .allDomainsMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try fileManager.contentsOfDirectory(at: usersUrl, includingPropertiesForKeys: nil, options: [])
//            print(directoryContents[1])
            let fullDirectory1 = directoryContents[1]
            let expand = fullDirectory1.appendingPathComponent("XcodeProjects/Snippet/books")
            let booksContents = try fileManager.contentsOfDirectory(at: expand, includingPropertiesForKeys: nil, options: [])
            
            // if you want to filter the directory contents you can do like this:
            let epubFiles = booksContents.filter{ $0.pathExtension == "epub" }
            
            let ebook = epubFiles.first!
            let bookFiles = try fileManager.contentsOfDirectory(at: ebook, includingPropertiesForKeys: nil, options: [])
            let onlyhtml = bookFiles.filter{ $0.pathExtension == "html" }
            let pathToUnzip = expand.path + "/Tests"
            
            for i in 0...onlyhtml.count-1{
                let typecheck: Data!
                typecheck = fileManager.contents(atPath: onlyhtml[i].path)
                let soCool = NSString(data: typecheck, encoding: String.Encoding.utf8.rawValue) as! String
                let file = "filenum\(i).txt"
                
                let filePath = pathToUnzip + "/" + file
                try soCool.write(toFile: filePath, atomically: true, encoding: .utf8)
                
                fileSnips += snipManager.createSnips(filePath: filePath)
//                print(typecheck)
            }
            
            BookShelf.addBook(book: fileSnips)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}






