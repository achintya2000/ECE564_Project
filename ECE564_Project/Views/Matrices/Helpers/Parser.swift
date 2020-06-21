//
//  Parser.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/16/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import Foundation
import Surge
class Parser {
    private let text: String
    private let rows: Int
    private let cols: Int
    init(text: String, rows: Int, cols: Int){
        self.text = text
        self.rows = rows
        self.cols = cols
    }
    
    func parse() throws -> Matrix<Double> {
        let lines = self.text.components(separatedBy: .whitespacesAndNewlines)
        var grid: [Double] = []
        for entry in lines {
            grid.append(Double(entry)!)
        }
        let ret = Matrix(rows: self.rows, columns: self.cols, grid: grid)
        print(ret)
        return ret
    }
}
