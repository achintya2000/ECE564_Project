//
//  VectorMath.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/13/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Accelerate
import simd
import Surge

struct VectorMath: View {
    typealias Scalar = Double
    
    @State var output = ""
    @State var operation : BasicOperation = .Add
    
    @State var v1_1 = 0.0
    @State var v1_2 = 0.0
    @State var v1_3 = 0.0
    @State var v1_4 = 0.0
    
    @State var v2_1 = 0.0
    @State var v2_2 = 0.0
    @State var v2_3 = 0.0
    @State var v2_4 = 0.0
            
    var body: some View {
        Form {
            Section(header: Text("Vector 1")) {
                HStack {
                    Spacer()
                    VectorInput(x: $v1_1, y: $v1_2, z: $v1_3, w: $v1_4)
                    Spacer()
                }
            }
            Section(header: Text("Vector 2")) {
                HStack {
                    Spacer()
                    VectorInput(x: $v2_1, y: $v2_2, z: $v2_3, w: $v2_4)
                    Spacer()
                }
            }
            Section(header: Text("Element Wise Operation")) {
                Picker(selection: $operation, label: Text("")) {
                    ForEach(BasicOperation.allCases, id: \.self) { op in
                        Text(op.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            HStack {
                Spacer()
                Button(action: {
                    let values1: Vector<Scalar> = [self.v1_1, self.v1_2, self.v1_3, self.v1_4]
                    let values2: Vector<Scalar> = [self.v2_1, self.v2_2, self.v2_3, self.v2_4]
                    
                    switch self.operation {
                    case .Add:
                        let result = Surge.add(values1, values2)
                        self.output = "\(result)"
                        break
                    case .Sub:
                        let result = Surge.sub(values1, values2)
                        self.output = "\(result)"
                        break
                    case .Mult:
                        let result = Surge.elmul(values1, values2)
                        self.output = "\(result)"
                        break
                    case .Div:
                        let result = Surge.eldiv(values1, values2)
                        self.output = "\(result)"
                        break
                    }
                }) {
                    Text("Submit")
                }
                Spacer()
            }
            Text("< \(output) >")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    func doWork() {
//        let c = Surge.add(values1, values2)
//        print(type(of: c))
//        print(c)
//        print(c[0])
    }
}

struct VectorMath_Previews: PreviewProvider {
    static var previews: some View {
        VectorMath()
    }
}

struct VectorInput: View {
    @Binding var x: Double
    @Binding var y: Double
    @Binding var z: Double
    @Binding var w: Double
    
    @State var dimension = 3
    
    var body: some View {
        HStack {
            TextField("0", value: $x, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
            TextField("0", value: $y, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
            TextField("0", value: $z, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
            TextField("0", value: $w, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
        }
    }
}

enum BasicOperation : String, CaseIterable {
    case Add = "Add"
    case Sub = "Sub"
    case Mult = "Mult"
    case Div = "Div"
}

