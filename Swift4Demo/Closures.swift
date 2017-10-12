//
//  Closures.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/12.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//MARK: - Closure Expression Syntax

//{ (parameters) -> return type in
//    statements
//}

func closuresDemo() {
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
    reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
    reversedNames = names.sorted(by: { $0 > $1 } )
    //Operator Methods
    reversedNames = names.sorted(by: >)
    //Trailing Closures
    reversedNames = names.sorted() { $0 > $1 }
    reversedNames = names.sorted { $0 > $1 }
    print(reversedNames)
    
    //Trailing Methods Demo
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    let strings = numbers.map { (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        return output
    }
    print(strings)
}

//MARK: - Capturing Values
func capturingValuesDemo() {
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    let incrementByTen = makeIncrementer(forIncrement: 10)
    print(incrementByTen())
    print(incrementByTen())
    let incrementBySeven = makeIncrementer(forIncrement: 7)
    print(incrementBySeven())
    print(incrementByTen())
}

//MARK: - Escaping Closures
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
func escapeingClosuresDemo() {
    let instance = SomeClass()
    instance.doSomething()
    print(instance.x)
    // Prints "200"
    print(completionHandlers.first)
    completionHandlers.first?()
    print(instance.x)
    // Prints "100"

}

//AMRK: - Autoclosures
func atuoClosures() {
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    // Prints "5"
    
    let customerProvider = { customersInLine.remove(at: 0) }
    print(customersInLine.count)
    // Prints "5"
    
    print("Now serving \(customerProvider())!")
    // Prints "Now serving Chris!"
    print(customersInLine.count)
    // Prints "4"
    
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: { customersInLine.remove(at: 0) } )
    print(customersInLine.count)
}
