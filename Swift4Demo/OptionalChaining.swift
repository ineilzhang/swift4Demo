//
//  OptionalChaining.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/25.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//MARK: - Optional Chaining as an Alternative to Forced Unwrapping

class Bookcase {
    var book: Book?
}

class Book {
    var pages = 100
}

func optionalChainingDemo() {
    let bookcase = Bookcase()
    
    //The main difference is that optional chaining fails gracefully when the optional is nil, whereas forced unwrapping triggers a runtime error when the optional is nil.
    
    bookcase.book = Book()
//    print(bookcase.book?.pages)
    
    if let pages = bookcase.book?.pages {
        print("bookcase.book?page = \(pages)")
    }else{
        print("nil...")
    }
}
