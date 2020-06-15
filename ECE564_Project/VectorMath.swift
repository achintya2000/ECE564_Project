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
    
    let values1: Vector<Scalar> = [1, 2, 3]
    let values2: Vector<Scalar> = [4, -5, 6]
    
    @State var input1 = ""
    @State var operation : BasicOperation = .Add
        
    var body: some View {
        Form {
            Section(header: Text("Vector 1")) {
                HStack {
                    Spacer()
                    VectorInput()
                    Spacer()
                }
            }
            Section(header: Text("Vector 2")) {
                HStack {
                    Spacer()
                    VectorInput()
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
                Button(action: {}) {
                    Text("Submit")
                }
                Spacer()
            }
        }.onAppear {
            self.doWork()
        }
    }
    
    func doWork() {
        let c = Surge.add(values1, values2)
        print(type(of: c))
        print(c)
        print(c[0])
    }
}

struct VectorMath_Previews: PreviewProvider {
    static var previews: some View {
        VectorMath()
    }
}

struct VectorInput: View {
    @State var x = ""
    @State var y = ""
    @State var z = ""
    @State var w = ""
    
    var body: some View {
        HStack {
            TextField("0", text: $x)
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
            TextField("0", text: $y)
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
            TextField("0", text: $z)
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
            TextField("0", text: $w)
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

