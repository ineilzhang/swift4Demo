//
//  StringAndCharacters.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/11.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func stringsAndCharactersDemo(){

    //MARK: - String Literals
    let someString = "Some string literal value"
    let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
    print(quotation)
    
    let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
    print(softWrappedQuotation)
    
    let lineBreaks = """
 
This string starts with a line break.
It also ends with a line break.
 
"""
    print(lineBreaks)
    
//MARK: - Special Characters in String Literals
    
    let dollarSign = "\u{24}"
    
    print(dollarSign)
    
//MARK: - Initializing an Empty String
    
    var emptyString = ""               // empty string literal
    var anotherEmptyString = String()  // initializer syntax
    // these two strings are both empty, and are equivalent to each other
    
    if emptyString.isEmpty {
        print("Nothing to see here")
    }
    
//MARK: - String Mutability
    
    var variableString = "Horse"
    variableString += " and carriage"
    // variableString is now "Horse and carriage"
    
    let constantString = "Highlander"
//    constantString += " and another Highlander"
    // this reports a compile-time error - a constant string cannot be modified
    
//MARK: - Strings Are Value Types
    
//    Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.
    
//MARK: - Working with Characters
    
    for character in "Dog!🐶" {
        print(character)
    }
    
    let exclamationMark: Character = "!"
    
    let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
    var catString = String(catCharacters)
    print(catString)
    
//MARK: - Concatenating Strings and Characters
    
    catString.append(exclamationMark)
    
    let badStart = """
one
two
"""
    let end = """
three
"""
    print(badStart + end)
    
    let goodStart = """
one
two
 
"""
    print(goodStart + end)
    
//MARK: - Counting Characters
    
    let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
    print("unusualMenagerie has \(unusualMenagerie.count) characters")
    
//MARK: - Accessing and Modifying a String
    
    //String Indices
    let greeting = "Guten Tag!"
    greeting[greeting.startIndex]
    // G
    greeting[greeting.index(before: greeting.endIndex)]
    // !
    greeting[greeting.index(after: greeting.startIndex)]
    // u
    let index = greeting.index(greeting.startIndex, offsetBy: 7)
    greeting[index]
    // a
    for index in greeting.indices {
        print("\(greeting[index]) ",terminator: "")
    }
    
    //Inserting and Removing
    print()
    var welcome = "Hello"
    welcome.insert("!", at: welcome.endIndex)
    print(welcome)
    
    welcome.insert(contentsOf: " World", at: welcome.index(before: welcome.endIndex))
    print(welcome)
    
    welcome.remove(at: welcome.index(after: welcome.startIndex))
    print(welcome)
    
    let range = welcome.index(after: welcome.startIndex)..<welcome.endIndex
    welcome.removeSubrange(range)
    print(welcome)
    
    //Substrings
    let hello = "Helloo World!"
    print(hello.count)
    let indexOfBlank = hello.index(of: " ")
    let newRange = ..<(indexOfBlank ?? hello.endIndex)
    let beginningSubString = hello[newRange]
    print(beginningSubString)
    if !beginningSubString.isEmpty {
        let newString = String(beginningSubString)
        print(newString)
    }
    
    //Comparing Strings
    let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
    
    // "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
    let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
    
    if eAcuteQuestion == combinedEAcuteQuestion {
        print("These two strings are considered equal")
    }
    
    //Prefix and Suffix Equality
    let romeoAndJuliet = [
        "Act 1 Scene 1: Verona, A public place",
        "Act 1 Scene 2: Capulet's mansion",
        "Act 1 Scene 3: A room in Capulet's mansion",
        "Act 1 Scene 4: A street outside Capulet's mansion",
        "Act 1 Scene 5: The Great Hall in Capulet's mansion",
        "Act 2 Scene 1: Outside Capulet's mansion",
        "Act 2 Scene 2: Capulet's orchard",
        "Act 2 Scene 3: Outside Friar Lawrence's cell",
        "Act 2 Scene 4: A street in Verona",
        "Act 2 Scene 5: Capulet's mansion",
        "Act 2 Scene 6: Friar Lawrence's cell"
    ]
    
    var act1SceneCount = 0
    
    for scene in romeoAndJuliet {
        if scene.hasPrefix("Act 1 Scene") {
            act1SceneCount += 1
        }
    }
    print(act1SceneCount)
    
    var mansionCount = 0
    var cellCount = 0
    for scene in romeoAndJuliet {
        if scene.hasSuffix("Capulet's mansion") {
            mansionCount += 1
        } else if scene.hasSuffix("Friar Lawrence's cell") {
            cellCount += 1
        }
    }
    print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
    
    //Unicode Representations of Strings
    
    let dogString = "Dog‼🐶"
    print("dogString.count=\(dogString.utf8.count)")
    print("dogString.count=\(dogString.utf16.count)")
    print("dogString.count=\(dogString.unicodeScalars.count)")
    for codeUnit in dogString.utf8 {
        print("\(codeUnit) ", terminator: "")
    }
    print("")
    
    for codeUint in dogString.utf16 {
        print("\(codeUint) ", terminator: "")
    }
    print()
    
    for scalar in dogString.unicodeScalars {
        print("\(scalar.value) ", terminator: "")
    }
    print()
}
