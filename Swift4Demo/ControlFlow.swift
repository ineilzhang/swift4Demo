//
//  ControlFlow.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/11.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

func controlFlowDemo() {
    
    //MARK: - For-In Loops
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }
    
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCount) in numberOfLegs {
        print("\(animalName)s have \(legCount) legs")
    }
    
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }
    
    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
        answer *= base
    }
    print("\(base) to the power of \(power) is \(answer)")
    
    let minutes = 60
    for tickMark in 0..<minutes {
        // render the tick mark each minute (60 times)
    }
    
    let minuteInterval = 5
    for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    }
    
//MARK: - While Loops
    
    //
}

func playAGame() {
    let finalSquare = 25
    var board = [Int](repeating: 0, count: finalSquare + 1)
    print(board)
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    var square = 0
    var diceRoll = 0
    while square < finalSquare {
        // roll the dice
        diceRoll = Int(arc4random_uniform(6) + 1)
        print(diceRoll, terminator: ":")
        // move by the rolled amount
        square += diceRoll
        if square < board.count {
            // if we're still on the board, move up or down for a snake or a ladder
            square += board[square]
            print(square)
        }
        
    }
    print("\nGame over!")
}

func palyAAGame() {
    //destination
    let destination = 25
    //dice
    var diceRoll = 0
    //square
    var square = 0
    //borad
    var borad = Array(repeatElement(0, count: 26))
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
}
