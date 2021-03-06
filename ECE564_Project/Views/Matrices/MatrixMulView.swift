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

// View for multiplying two matrices
struct MatrixMulView: View {
    @State var operation: MatrixOperation = .Determinent
    @State var result: String = ""
    @State var matrixInput1: String = ""
    @State var rows: Int = 0
    @State var cols: Int = 0
    @State var matrixInput2: String = ""
    @State var rows2: Int = 0
    @State var cols2: Int = 0
    @State var showError: Bool = false
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
            }.alert(isPresented: self.$showError) {
                Alert(title: Text("Error"), message: Text("Please enter a square matrix!"), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                do {
                    let myMatrix1 = try Parser(text: self.matrixInput1, rows: self.rows, cols: self.cols).parse(square: false)
                    let myMatrix2 = try Parser(text: self.matrixInput2, rows: self.rows2, cols: self.cols2).parse(square: false)
                    self.result = Surge.mul(myMatrix1, myMatrix2).description
                } catch {
                    self.showError.toggle()
                    self.result = ""
                }
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
