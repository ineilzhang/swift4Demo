//
//  Enumerations.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/12.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func enumerationsDemo () {
    enum SomeEnumeration {
        // enumeration definition goes here
    }
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    //Matching Enumeration Values with a Switch Statement
    var directionToHead = CompassPoint.west
    directionToHead = .south
    switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
    }
    
    //Associated Values
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    var productBarcode = Barcode.upc(8, 85909, 51226, 3)
    
    productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
    
    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
    
    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
    }
    
    //Raw Values
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    enum PlanetNew: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    var PlanetE = Planet.earth
    
    switch PlanetE {
    case .earth:
        print("\(PlanetE)")
    default:
        print("default")
    }
    
    enum CompassPointNew: String {
        case north, south, east, west
    }
    
    let earthsOrder = PlanetNew.earth.rawValue
    
    let sunsetDirection = CompassPointNew.west.rawValue

    print("PlanetNew.earth.rawValue=\(earthsOrder)\nCompassPointNew.west.rawValue=\(sunsetDirection)")
    
    //Initializing from a Raw Value
    let positionToFind = 11
    if let somePlanet = PlanetNew(rawValue: positionToFind) {
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }

    //Recursive Enumerations
    enum ArithmeticExpression {
        case number(Int)
        indirect case addition(ArithmeticExpression, ArithmeticExpression)
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    indirect enum ArithmeticExpressionNew {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    let sum = ArithmeticExpression.addition(five, four)
    let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
    
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }
    
    print(evaluate(product))
}
