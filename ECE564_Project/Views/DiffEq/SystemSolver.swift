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
                    print("Error")
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
        let myMatrix = Parser(text: self.matrixInput, rows: self.rows, cols: self.cols).parse()
        return try Surge.eigenDecompose(myMatrix)
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
