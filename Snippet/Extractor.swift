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
    
    var htmlFiles = [String]()
    
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
            let cssfiles = bookFiles.filter{ $0.pathExtension == "css" }
            let pathToUnzip = expand.path + "/Tests"
            let htmlUnzip = expand.path + "/HtmlTests"
            
            for i in 0...cssfiles.count-1{
                let typec: Data!
                typec = fileManager.contents(atPath: cssfiles[i].path)
                let whaatNoWay = NSString(data: typec, encoding: String.Encoding.utf8.rawValue) as! String
                let cssFileName = (cssfiles[i].path as NSString).lastPathComponent
                let cssPath = htmlUnzip + "/" + cssFileName
                try whaatNoWay.write(toFile: cssPath, atomically: true, encoding: .utf8)
            }
            
            for i in 0...onlyhtml.count-1{
                let typecheck: Data!
                typecheck = fileManager.contents(atPath: onlyhtml[i].path)
                let soCool = NSString(data: typecheck, encoding: String.Encoding.utf8.rawValue) as! String
                let file = "filenum\(i).txt"
                let htmlFile = "fileHtml\(i).html"
                
                let htmlPath = htmlUnzip + "/" + htmlFile
                try soCool.write(toFile: htmlPath, atomically: true, encoding: .utf8)
                
                let filePath = pathToUnzip + "/" + file
                try soCool.write(toFile: filePath, atomically: true, encoding: .utf8)
                
                fileSnips += snipManager.createSnips(filePath: filePath)
                htmlFiles += ["fileHtml\(i)"]
//                print(typecheck)
            }
            
            BookShelf.addBookHtml(bookHtmls: htmlFiles)
            BookShelf.addBook(book: fileSnips)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}






