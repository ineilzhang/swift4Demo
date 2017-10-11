//
//  CollectionTypes.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/11.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func collectionTypesDemo() {
    
//MARK: - Arrays
    //Creating an Empty Array
    var someInts = [Int]()
    print("someInts is of type [Int] with \(someInts.count) items.")
    someInts.append(3)
    someInts = []
    print(someInts)
    
    //Creating an Array with a Default Value
    var threeDoubles = Array(repeating: 0.0, count: 3)
    print(threeDoubles)
    
    //Creating an Array by Adding Two Arrays Together
    var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    var sixDoubles = threeDoubles + anotherThreeDoubles
    print(sixDoubles)
    
    //Creating an Array with an Array Literal
    var shoppingList: [String] = ["Eggs", "Milk"]
    print(shoppingList)
    
    //Accessing and Modifying an Array
    print("The shopping list contains \(shoppingList.count) items.")
    shoppingList.append("Banana")
    print(shoppingList)
    shoppingList += ["Apple"]
    print(shoppingList)
    print("shoppingList index 0 = \(shoppingList[0])")
    shoppingList[1...3] = ["Pich","Bread"]
    print(shoppingList)
    shoppingList.insert("xxx", at: 0)
    print(shoppingList)
    shoppingList.remove(at: 0)
    print(shoppingList)
    
    //Iterating Over an Array
    for item in shoppingList {
        print(item, terminator: " ")
    }
    print()
    for (index, value) in shoppingList.enumerated() {
        print("\(index+1):\(value)")
    }
    
//MARK: - Sets
    
    //Creating and Initializing an Empty Set
    var letters = Set<Character>()
    letters.insert("a")
    print("letters is of type Set<Character> with \(letters.count) items.")
    
    //Creating a Set with an Array Literal
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
    
    //Accessing and Modifying a Set
    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    
    favoriteGenres.insert("Jazz")
    print(favoriteGenres)
    
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    
    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }

    //Iterating Over a Set
    for genre in favoriteGenres {
        print("\(genre)")
    }
    
    for genre in favoriteGenres.sorted() {
        print("\(genre)")
    }
    
    //Fundamental Set Operations
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    print(oddDigits.union(evenDigits).sorted())
    print(oddDigits.intersection(evenDigits).sorted())
    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
    
    //Set Membership and Equality
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    print(houseAnimals.isSubset(of: farmAnimals))
    print(farmAnimals.isSuperset(of: cityAnimals))
    print(farmAnimals.isDisjoint(with: cityAnimals))
    
    
//MARK: - Dictionaries
    
    //Creating an Empty Dictionary
    var namesOfIntegers = [Int: String]()
    namesOfIntegers[16] = "sixteen"
    namesOfIntegers = [:]
    
    //Creating a Dictionary with a Dictionary Literal
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    
    //Accessing and Modifying a Dictionary
    print("The airports dictionary contains \(airports.count) items.")
    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary is not empty.")
    }
    airports["LHR"] = "London"
    airports["LHR"] = "LondonNew"
    
    if let oldValue = airports.updateValue("newValue", forKey: "DUB") {
        print(oldValue)
        print(airports)
    }else {
        print("error")
    }
    
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport is not in the airports dictionary.")
    }
    
    //add
    airports["APL"] = "Apple International"
    // "Apple International" is not the real airport for APL, so delete it
    airports["APL"] = nil
    // APL has now been removed from the dictionary
    
    print(airports)
    
    //remove
    if let removedValue = airports.removeValue(forKey: "DUB") {
        print("The removed airport's name is \(removedValue).")
    } else {
        print("The airports dictionary does not contain a value for DUB.")
    }
    // Prints "The removed airport's name is Dublin Airport."

    //Iterating Over a Dictionary
    for (code, name) in airports {
        print("\(code):\(name)")
    }
    
    for airportCode in airports.keys {
        print("Airport code: \(airportCode)")
    }
    
    for airportName in airports.values {
        print("Airport name: \(airportName)")
    }
    
    let airportCodes = [String](airports.keys)
    // airportCodes is ["YYZ", "LHR"]
    
    let airportNames = [String](airports.values)
    // airportNames is ["Toronto Pearson", "London Heathrow"]
    
    print(airports)
    print(airportNames)
}
