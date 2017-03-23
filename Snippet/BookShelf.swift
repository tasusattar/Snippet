//
//  BookShelf.swift
//  Snippet
//
//  Created by Paul on 2017-03-23.
//  Copyright © 2017 Refinery. All rights reserved.
//

import Foundation

class BookShelf {
    static private var indexToBook = [Int: [Snip]]()
    static private var i = 0
    
    static func getIndToSnip() -> [Int : [Snip]]{
        return indexToBook
    }
    
    static func addBook(book: [Snip]){
        BookShelf.indexToBook[BookShelf.i] = book
        BookShelf.i += 1
        
    }
    
    static func removeBook(bookIndex: Int){
        BookShelf.indexToBook[bookIndex] = []
    }
    
    static func getBookAt(bookIndex: Int) -> [Snip]{
        return BookShelf.indexToBook[bookIndex]!
    }
    
}
