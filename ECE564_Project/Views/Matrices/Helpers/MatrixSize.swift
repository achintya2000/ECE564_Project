//
//  MatrixSize.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import Foundation

// Class that implements ObservableObject to ensure changes in Matrix refresh the view
class MatrixSize: ObservableObject {
    @Published var numRow: [Int] = [0]
    @Published var numCol: [Int] = [0]
}
