//
//  MatrixAddView.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/17/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

//
//  StringMatrixView.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/16/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Surge
struct MatrixMulView: View {
    @State var operation: MatrixOperation = .Determinent
    @State var result: String = ""
    @State var matrixInput1: String = ""
    @State var rows: Int = 0
    @State var cols: Int = 0
    @State var matrixInput2: String = ""
    @State var rows2: Int = 0
    @State var cols2: Int = 0
    var body: some View {
        Form {
            Section(header: Text("Matrix 1")){
                Section(header: Text("Matrix")){
                    TextField("Matrix", text: self.$matrixInput1)
                }
                Section(header: Text("Row/Cols")) {
                    HStack {
                        TextField("Rows", value: self.$rows, formatter: NumberFormatter())
                        TextField("Cols", value: self.$cols, formatter: NumberFormatter())
                    }
                
                }
                
            }
            Section(header: Text("Matrix 2")){
                Section(header: Text("Matrix")){
                    TextField("Matrix", text: self.$matrixInput2)
                }
                Section(header: Text("Row/Cols")) {
                    HStack {
                        TextField("Rows", value: self.$rows2, formatter: NumberFormatter())
                        TextField("Cols", value: self.$cols2, formatter: NumberFormatter())
                    }
                }
            }
            
            Button(action: {
                let myMatrix1 = Parser(text: self.matrixInput1, rows: self.rows, cols: self.cols).parse()
                let myMatrix2 = Parser(text: self.matrixInput2, rows: self.rows2, cols: self.cols2).parse()
                self.result = Surge.mul(myMatrix1, myMatrix2).description
            })
            {
                Text("Add")
            }
            Text("\(result)")
        }
    .navigationBarTitle(Text("Matrix Multiplication"))
    }
}

struct MatrixAddView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixMulView()
    }
}
