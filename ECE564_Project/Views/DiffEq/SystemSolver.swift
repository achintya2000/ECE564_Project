//
//  SystemSolver.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/19/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Surge
struct SystemSolver: View {
    @State var result: String = ""
    @State var matrixInput: String = ""
    @State var rows: Int = 0
    @State var cols: Int = 0
    @State var dynamicData: [DynamicData] = []
    @State private var numEVals: [(Double, Double)] = []
    @State private var numEVecs: [(Double, Double)] = []
    @State var showError: Bool = false
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
            
            }.alert(isPresented: self.$showError) {
                Alert(title: Text("Error"), message: Text("Please enter a square matrix!"), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                do {
                    let eRes = try self.eigenHelper()
                    let eVals = eRes.eigenValues
                    let eVecs = eRes.rightEigenVectors
                    var resi: String = ""
                    var index: Int = 0
                    for value in eVals {
                        self.numEVals.append(value)
                        self.numEVecs.append(contentsOf: eVecs[index])
                        
                        self.dynamicData.append(DynamicData(id: UUID(), numEVals: value, numEVecs: eVecs[index]))
                        
                        resi.append("e^( \(value)*t) * \(eVecs[index].description) + ")
                        index += 1
                    }
                    self.result = resi
                } catch {
                    self.showError.toggle()
                    self.result = ""
                }
                
            })
            {
                Text("Submit")
            }
            ForEach(dynamicData) {
                ind in
                Text("e") +
                Text("\(ind.numEVals.0.description)t").font(.system(size: 8.0))
                    .baselineOffset(6.0) +
                    Text("\(ind.numEVecs.description)")
            }
        }
        .navigationBarTitle(Text("Systems of Diff Eqns"))
    }
    
    func eigenHelper() throws -> MatrixEigenDecompositionResult<Double>{
        do {
            let myMatrix = try Parser(text: self.matrixInput, rows: self.rows, cols: self.cols).parse(square: true)
            return try Surge.eigenDecompose(myMatrix)
        } catch {
            self.showError.toggle()
        }
        return try Surge.eigenDecompose(Matrix.identity(size: 3))
    }
}

struct DynamicData: Identifiable {
    var id = UUID()
    var numEVals: (Double, Double)
    var numEVecs: [(Double, Double)]
}

struct SystemSolver_Previews: PreviewProvider {
    static var previews: some View {
        SystemSolver()
    }
}
