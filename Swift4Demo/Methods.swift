//
//  Methods.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/16.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//Methods are functions that are associated with a particular type.
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

func CounterDemo() {
    let counter = Counter()
    // the initial counter value is 0
    counter.increment()
    // the counter's value is now 1
    counter.increment(by: 5)
    // the counter's value is now 6
    counter.reset()
    // the counter's value is now 0
    print(counter.count)
}


//The self Property
func selfDemo() {
    struct Point {
        var x = 0.0, y = 0.0
        func isToTheRightOf(x: Double) -> Bool {
            return self.x > x
        }
    }
    let somePoint = Point(x: 4.0, y: 5.0)
    if somePoint.isToTheRightOf(x: 1.0) {
        print("This point is to the right of the line where x == 1.0")
    }
}

//Modifying Value Types from Within Instance Methods
//Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
func modifyingValueTypesDemo() {
    struct Point {
        var x = 0.0, y = 0.0
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }
    var somePoint = Point(x: 1.0, y: 1.0)
    somePoint.moveBy(x: 2.0, y: 3.0)
    print("The point is now at (\(somePoint.x), \(somePoint.y))")
    
//    let fixedPoint = Point(x: 3.0, y: 3.0)
//    fixedPoint.moveBy(x: 2.0, y: 3.0)
//     this will report an error

}

//Assigning to self Within a Mutating Method
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

func selfMutatingDemo() {
    var ovenLight = TriStateSwitch.low
    ovenLight.next()
    ovenLight.next()
    print(ovenLight)
}

//MARK: - Type Method

class SomeClassNew {
    class func someTypeMethod() {
        print("Here is a class type method")
    }
}

func classTypeMethodDemo() {
    SomeClassNew.someTypeMethod()
}


//MARK: - LevelTrackerDemo

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlock(_ level:Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level:Int) -> Bool {
        if LevelTracker.isUnlock(level) {
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level:Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name;
    }
}

func levelTrackerDemo() {
    var player = Player(name: "HaHe")
    player.complete(level: 5)
    print("highestUnlockedLevel=\(LevelTracker.highestUnlockedLevel)\ncurrentLevel=\(player.tracker.currentLevel)\nplayer.tracker.advance.to.6=\(player.tracker.advance(to: 6))")
}

