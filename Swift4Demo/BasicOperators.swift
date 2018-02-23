//
//  basicOperators.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/10.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func operatorDemo(){
    
//MARK: - Assignment Operator
    
    let b = 10
    var a = 5
    a = b
    print(a)
    
    let (x, y) = (1, 2)
    print("\(x)")
    
    //    if x = y {
            // This is not valid, because x = y does not return a value.
    //    }
    
//MARK: - Arithmetic Operators
    
    print(1 + 2)
    print(5 - 3)
    print(10.0 / 2.5)
    print(10.0 * 4)
    print("Hello" + " World")
    
//MARK: - Remainder Operator
    
    print(8 % 3)
    
//MARK: - Unary Minus Operator
    
    let three = 3
    let minusThree = -three       // minusThree equals -3
    let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
    
    print("\(minusThree)  \(plusThree)")
    
//MARK: - Unary Plus Operator
    
    let minusSix = -6
    let alsoMinusSix = +minusSix
    print("\(alsoMinusSix)")
    
//MARK: - Compound Assignment Operators
    
    var aa = 1
    aa += 2 // a is now equal to 3
    
//MARK: - Comparison Operators
    
    1 == 1   // true because 1 is equal to 1
    2 != 1   // true because 2 is not equal to 1
    2 > 1    // true because 2 is greater than 1
    1 < 2    // true because 1 is less than 2
    1 >= 1   // true because 1 is greater than or equal to 1
    2 <= 1   // false because 2 is not less than or equal to 1
    
    (1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
    (3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
    (4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
    
    ("blue", -1) < ("purple", 1)        // OK, evaluates to true
    //("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
    
//MARK: - Ternary Conditional Operator
    
    let contentHeight = 40
    let hasHeader = true
    let rowHeight = contentHeight + (hasHeader ? 50 : 20)
    // rowHeight is equal to 90
    
//MARK: - Nil-Coalescing Operator
    
    //    ?? =>  a != nil ? a! : b
    
    let defaultColorName = "red"
    var userDefinedColorName: String?   // defaults to nil
    
    var colorNameToUse = userDefinedColorName ?? defaultColorName
    // userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
    
    userDefinedColorName = "green"
    colorNameToUse = userDefinedColorName ?? defaultColorName
    // userDefinedColorName is not nil, so colorNameToUse is set to "green"

    
//MARK: - Range Operators
    
    //Closed Range Operator
    for index in (1...5).reversed() {
        print("\(index) times 5 is \(index * 5)")
    }
    
    //Half-Open Range Operator
    let names = ["Anna", "Alex", "Brian", "Jack"]
    let count = names.count
    for i in 0..<count {
        print("Person \(i + 1) is called \(names[i])")
    }
    print("\n")
    //One-Sided Ranges
    for name in names[2...] {
        print(name)
    }
    print("\n")
    for name in names[...2] {
        print(name)
    }
    print("\n")
    for name in names[..<2] {
        print(name)
    }
    print("\n")
//MARK: - Logical Operators
    
    //Logical NOT Operator
    let allowedEntry = false
    if !allowedEntry {
        print("ACCESS DENIED")
    }
    
    //Logical AND Operator
    let enteredDoorCode = true
    let passedRetinaScan = false
    if enteredDoorCode && passedRetinaScan {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }

    //Logical OR Operator
    let hasDoorKey = false
    let knowsOverridePassword = true
    if hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }
}
