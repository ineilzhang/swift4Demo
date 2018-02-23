//
//  Deinitialization.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/25.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//MARK: - Deinitializers in Action

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Playerr {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

func deinitDemo() {
    var playerOne: Playerr? = Playerr(coins: 100)
    print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
    print("There are now \(Bank.coinsInBank) coins left in the bank")
    
    playerOne = nil
    print("PlayerOne has left the game")
    print("The bank now has \(Bank.coinsInBank) coins")
}
