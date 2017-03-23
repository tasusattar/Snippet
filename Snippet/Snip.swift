//
//  Snip.swift
//  Snippet
//
//  Created by Paul on 2017-03-23.
//  Copyright © 2017 Refinery. All rights reserved.
//

import Foundation

class Snip{
    
    let snipNumber: Int
    private static var maxLines = 5
    private let content : String
    
    init(snipNumber: Int, content: String){
        self.snipNumber = snipNumber
        self.content = content
    }
    
    func getContents() -> String {
        return self.content
    }
    
    static func getMaxLines() -> Int{
        return Snip.maxLines
    }
    
    static func setMaxLines(max : Int) {
        Snip.maxLines = max
    }

}


class SnipGenerator{
    let fileManager = FileManager.default
    var fileSnips = [Snip]()
    //    let filePath : String
    //    let fileData : Data?
    //    let fullContent : String
    
    
    init(){}
    
    func createSnips(filePath: String) -> [Snip] {
        if (fileManager.fileExists(atPath: filePath)){
            let fileData = fileManager.contents(atPath: filePath)!
            let fullContent = String(data: fileData, encoding: String.Encoding.utf8)!
            let myStrings = fullContent.components(separatedBy: .newlines)
            
            var contents = ""
            var i = 0
            var j = 0
            
            while (i < myStrings.count){
                while (j < Snip.getMaxLines()){
                    if (i+j < myStrings.count){
                        contents += myStrings[i+j] + "\n"
                    }
                    j += 1
                }
                self.fileSnips.append(Snip(snipNumber: i+j+1, content: contents))
                contents = ""
                i = i+j
                j = 0
            }
            //              print(myStrings[1])
            //              .text = myStrings.joined(separator: ", ")
            //          } catch let error as NSError{
            //              print(error.localizedDescription)
            //          }
        }
        
        return self.fileSnips
    }
    
}
