//
//  Subscripts.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/19.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//MARK: - Subscript Syntax

struct TimesTable {
    let multiplier: Int
    subscript(index:Int) -> Int {
        get {
            return index * multiplier
        }
        set(newValue){
            
        }
    }
}

func subscriptDemo() {
    let threeTimesTable = TimesTable(multiplier: 3)
    print("threeTimesTable[6]=\(threeTimesTable[6])")
}


//MARK: - Subscript Usage

struct Matix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && column >= 0 && rows >= row && columns >= column
    }
    
    subscript(row: Int, column: Int) -> Double {
        get{
            assert(indexIsValid(row: row, column: column),"Index out of range")
            return grid[row * columns + column]
        }
        set{
            assert(indexIsValid(row: row, column: column),"Index out of range")
            grid[row * columns + column] = newValue
        }
    }
}

func matixDemo() {
    var matix = Matix(rows: 2, columns: 2)
    print("before matix=\(matix) and matix[0,1]=\(matix[0,1])")
    matix[0,0] = 0.01
    matix[0,1] = 0.11
    matix[1,0] = 1.01
    matix[1,1] = 1.11
    print("now matix=\(matix)")
    print("matix[2,2] isValid?=\(matix[2,2])")
}
