//
//  StringMatrixView.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/16/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Surge
struct StringMatrixView: View {
    @State var operation: MatrixOperation = .Determinent
    @State var result: String = ""
    @State var matrixInput: String = ""
    @State var rows: Int = 0
    @State var cols: Int = 0
    var body: some View {
        Form {
            Section(header: Text("Matrix")){
                TextField("Matrix", text: self.$matrixInput)
            }
            Section(header: Text("Row/Cols")) {
                HStack {
                    TextField("Rows", value: self.$rows, formatter: NumberFormatter())
                    TextField("Cols", value: self.$cols, formatter: NumberFormatter())
                }
            
            }
            Section(header: Text("Operation")) {
                Picker(selection: $operation, label: Text("")) {
                    ForEach(MatrixOperation.allCases, id: \.self) { op in
                        Text(op.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                let myMatrix = Parser(text: self.matrixInput, rows: self.rows, cols: self.cols).parse()
                switch self.operation {
                case .Determinent:
                    self.result = String(Surge.det(myMatrix)?.description ?? "Det DNE")
                    break
                case .Inverse:
                    self.result = Surge.inv(myMatrix).description
                    break
                case .Transpose:
                    self.result = Surge.transpose(myMatrix).description
                    break
                    
                }
            })
            {
                Text("Submit")
            }
            Text("\(result)")
        }
    }
}

enum MatrixOperation : String, CaseIterable {
    case Determinent = "Determinent"
    case Transpose = "Transpose"
    case Inverse = "Inverse"
}

struct StringMatrixView_Previews: PreviewProvider {
    static var previews: some View {
        StringMatrixView()
    }
}
