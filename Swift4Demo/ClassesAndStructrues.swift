//
//  File.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/13.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func classAndStructDemo() {
    //Definition Syntax
    class SomeClass {
        // class definition goes here
    }
    struct SomeStructure {
        // structure definition goes here
    }
    
    struct Resolution {
        var height = 0
        var width = 0
    }
    
    class VideoMode {
        var resolution = Resolution()
        var interlaced = false
        var frameRate = 0.0
        var name: String?
    }
    
    //Class and Structure Instances
    let someResolution = Resolution()
    let someVideoMode = VideoMode()
    
    //Accessing Properties
    print("The width of someResolution is \(someResolution.width)")
    print("The width of someVideoMode is \(someVideoMode.resolution.width)")
    someVideoMode.resolution.width = 1280
    print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
    
    //Memberwise Initializers for Structure Types
    let vga = Resolution(height: 480, width: 640)
    
    //Structures and Enumerations Are Value Types
//    A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.
    let hd = Resolution(height: 1080, width: 1920)
    var cinema = hd
    cinema.width = 208
    print(cinema.width)
    print(hd.width)
    
    enum CompassPoint {
        case north, south, east, west
    }
    var currentDirection = CompassPoint.west
    let rememberedDirection = currentDirection
    currentDirection = .east
    if rememberedDirection == .west {
        print("The remembered direction is still .west")
    }
    
    //Classes Are Reference Types
    let tenEighty = VideoMode()
    tenEighty.resolution = hd
    tenEighty.interlaced = true
    tenEighty.name = "1080i"
    tenEighty.frameRate = 25.0
    
    let alsoTenEighty = tenEighty
    alsoTenEighty.frameRate = 30.0
    print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
    
    //Identity Operators
    if tenEighty === alsoTenEighty {
        print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
    }
    
}
