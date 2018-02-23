//
//  basics.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/10.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func basicsDemo(){
    //MARK: - declare constants and variables
    
    
    let maximumNumberOfLoginAttempts = 10
    
    var currentLoginAttempt = 0
    
    var x = 0.0, y = 0.0, z: Double = 0.0
    
    var welcomeMessage: String = "hello world"
    
    
    print("\(welcomeMessage) \(maximumNumberOfLoginAttempts)")
    
    //MARK: - Type Inference
    //Int
    let maxNum = 120
    //Double
    let pi = 3.14159
    //Double
    let sum = 1 + 2.0
    
    print("maxNum = \(maxNum) and pi = \(pi)")
    
    //MARK: - scale
    //Binary
    let binaryInteger = 0b10010
    //Octal
    let octalInteger = 0o2457
    //Decimal
    let decimalInteger = 190
    //Hex
    let hexInteger = 0xef43
    
    print("binary:\(binaryInteger)\noctal:\(octalInteger)\ndecimal:\(decimalInteger)\nhex:\(hexInteger)")
    
    let decimalDouble = 12.1875
    let exponentDouble = 1.21875e1
    let hexadecimalDouble = 0xC.3p0
    
    print("\(decimalDouble)  \(exponentDouble) \(hexadecimalDouble)")
    
    let paddedDouble = 000123.456
    let oneMillion = 1_000_000
    let justOverOneMillion = 1_000_000.000_000_1
    
    print("\(paddedDouble) \(oneMillion) \(justOverOneMillion)")
    
    //MARK: - Type Aliases
    
    typealias AudioSample = UInt16
    
    var maxAmplitudeFound = AudioSample.min
    
    print("\(maxAmplitudeFound)")
    
    //MARK: - Booleans
    
    let orangesAreOrange = true
    let turnipsAreDelicious = false
    if turnipsAreDelicious {
        print("\(turnipsAreDelicious)")
    }else{
        print("\(!turnipsAreDelicious)")
    }
    
    //MARK: - Tuples
    
    let http404Error = (404, "Not Found")
    
    let (statusCode,statusMessage) = http404Error
    
    print("\(statusCode) \(statusMessage)")
    
    let (statusCodeOnly, _) = http404Error
    
    print("\(statusCodeOnly)")
    
    print("The status code is \(http404Error.0)")
    
    print("The status message is \(http404Error.1)")
    
    let http200Status = (statusCode: 200, description: "OK")
    
    print("The status code is \(http200Status.statusCode)")
    
    print("The status message is \(http200Status.description)")
    
    //MARK: - Optionals
    
    let possibleNumber1 = "123"
    let convertedNumber1 = Int(possibleNumber1)//Optional(123)
    let possibleNumber2 = "234."
    let convertedNumber2 = Int(possibleNumber2)//nil
    print("\(String(describing: convertedNumber1)) \(String(describing: convertedNumber2))")
    
    //MARK: - If Statements and Forced Unwrapping
    
    if convertedNumber1 != nil {
        print("convertedNumber1 not nil and convertedNumber1 is \(convertedNumber1!)")
    }
    if convertedNumber2 != nil {
        print("convertedNumber2 not nil")
    }
    
    //MARK: - Optional Binding
    
    if let actualNumber = Int(possibleNumber1) {
        print("\"\(possibleNumber1)\" has a actual number \(actualNumber)")
    }
    
    if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100")
    }
    
    //MARK: - Implicitly Unwrapped Optionals
    
    let possibleString: String? = "An optional string."
    let forcedString: String = possibleString! // requires an exclamation mark
    
    let assumedString: String! = "An implicitly unwrapped optional string."
    let implicitString: String = assumedString // no need for an exclamation mark
    
    if assumedString != nil {
        print("possibleString = \(String(describing: possibleString)) forcedString = \(forcedString)")
        print("assumedString = \(assumedString) implicitString = \(implicitString)")
    }
    
    if let definiteString = assumedString {
        print(definiteString)
    }
    
    //MARK: - Error Handling
    
    func canThrowAnError() throws {
        // this function may or may not throw an error
        let http404 = (404,"not found")
        print(http404)
    }
    
    do {
        try canThrowAnError()
        // no error was thrown
        print("no error was thrown")
    } catch {
        // an error was thrown
        print("an error was thrown")
    }
    
    //MARK: - Assertions and Preconditions
    
    let age = 3
//    assert(age <= 0, "A person's age can't be less than zero.") //crash
    
    if age > 10 {
        print("You can ride the roller-coaster or the ferris wheel.")
    } else if age > 0 {
        print("You can ride the ferris wheel.")
    } else {
        assertionFailure("A person's age can't be less than zero.")
    }
    
    precondition(age > 0, "Index must be greater than zero.") //crash
}
