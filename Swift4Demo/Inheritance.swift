//
//  Inheritance.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/19.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//MARK: - Defining a Base Class

//Any class that does not inherit from another class is known as a base class.

class Vehicle {
    var currentSpeed: Double = 0.0
    var description: String {
        return "current speed is \(currentSpeed)"
    }
    func makeNoise() {
        
    }
}

func baseClassDemo() {
    var vehicle = Vehicle()
    vehicle.currentSpeed = 20.0
    print("vehicle \(vehicle.description)")
}

//MARK: - Subclassing

class  Bicycle: Vehicle{
    var hasBasket = false
}

func subclassDemo() {
    let bicycle = Bicycle()
    bicycle.currentSpeed = 100.0
    print("bicycle.hasBasket=\(bicycle.hasBasket) and \(bicycle.description)")
}

//MARK: - Tandem

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
    override var description: String {
        print("tandem currentSpeed = \(currentSpeed) and hasBasket = \(hasBasket) and currentNumberOfPassengers = \(currentNumberOfPassengers)")
        return super.description
    }
}

func tandemDemo() {
    let tandem = Tandem()
    tandem.currentNumberOfPassengers = 2
    tandem.hasBasket = true
    tandem.currentSpeed = 22
    print(tandem.description)
}

//MARK: - Overriding

class Train: Vehicle {
    //Overriding Methods
    override func makeNoise() {
        print("wuwuwu...")
    }
    
    var gear = 0
    override var description: String {
        return super.description + " and gear = \(gear)"
    }
    
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed/10 + 1)
        }
    }
}

func trainDemo() {
    let train = Train()
    train.makeNoise()
    print(train.description)
    print("before train gear = \(train.gear)")
    train.currentSpeed = 100
    print("after train gear = \(train.gear)")
}

//MARK: - Preventing Overrides

//Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).

//You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class).


