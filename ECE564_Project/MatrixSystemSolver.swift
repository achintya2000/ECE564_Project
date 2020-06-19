//
//  MatrixSystemSolver.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/18/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Surge
struct MatrixSystemSolver: View {
    @State var operation: MatrixOperation = .Determinent
    @State var result: String = ""
    @State var matrixInput1: String = ""
    @State var rows: Int = 0
    @State var cols: Int = 0
    @State var matrixInput2: String = ""
    @State var rows2: Int = 0
    var cols2: Int = 1
    var body: some View {
        Form {
            Section(header: Text("Coefficient Matrix")){
                Section(header: Text("Matrix")){
                    TextField("Enter", text: self.$matrixInput1)
                }
                Section(header: Text("Row/Cols")) {
                    HStack {
                        TextField("Rows", value: self.$rows, formatter: NumberFormatter())
                        TextField("Cols", value: self.$cols, formatter: NumberFormatter())
                    }
                
                }
                
            }
            Section(header: Text("B Matrix")){
                Section(header: Text("Matrix")){
                    TextField("Enter", text: self.$matrixInput2)
                }
                Section(header: Text("Row")) {
                    HStack {
                        TextField("Rows", value: self.$rows2, formatter: NumberFormatter())
    
                    }
                
                }
                
                }
            
            
            
            Button(action: {
                let myMatrix1 = Parser(text: self.matrixInput1, rows: self.rows, cols: self.cols).parse()
                let myMatrix2 = Parser(text: self.matrixInput2, rows: self.rows2, cols: self.cols2).parse()
                let myMatrix3 = Surge.inv(myMatrix1)
                self.result = Surge.mul(myMatrix3, myMatrix2).description
            
            })
            {
                Text("Solve")
            }
            Text("\(result)")
            

            
        }
        
        
    }
}
struct MatrixSystemSolver_Previews: PreviewProvider {
    static var previews: some View {
        MatrixSystemSolver()
    }
}
