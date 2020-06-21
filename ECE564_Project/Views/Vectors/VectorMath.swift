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
    @State var output = ""
    @State var operation : BasicOperation = .Add
    @State var vectorSize : VectorSize = .Three
    
    @State var v1_1 = 0.0
    @State var v1_2 = 0.0
    @State var v1_3 = 0.0
    @State var v1_4 = 0.0
    @State var v1_5 = 0.0
    
    @State var v2_1 = 0.0
    @State var v2_2 = 0.0
    @State var v2_3 = 0.0
    @State var v2_4 = 0.0
    @State var v2_5 = 0.0
            
    var body: some View {
        Form {
            Section(header: Text("Select Vector Size")) {
                Picker(selection: $vectorSize, label: Text("Vector Size")) {
                    ForEach(VectorSize.allCases, id: \.self) { size in
                        Text(size.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Vector 1")) {
                HStack {
                    Spacer()
                    if (vectorSize == VectorSize.Three) {
                        VectorInput3(x: $v1_1, y: $v1_2, z: $v1_3)
                    } else if (vectorSize == VectorSize.Four) {
                        VectorInput4(x: $v1_1, y: $v1_2, z: $v1_3, w: $v1_4)
                    } else if (vectorSize == VectorSize.Five) {
                        VectorInput5(x: $v1_1, y: $v1_2, z: $v1_3, w: $v1_4, v: $v1_5)
                    }
                    Spacer()
                }
            }
            Section(header: Text("Vector 2")) {
                HStack {
                    Spacer()
                    if (vectorSize == VectorSize.Three) {
                        VectorInput3(x: $v2_1, y: $v2_2, z: $v2_3)
                    } else if (vectorSize == VectorSize.Four) {
                        VectorInput4(x: $v2_1, y: $v2_2, z: $v2_3, w: $v2_4)
                    } else if (vectorSize == VectorSize.Five) {
                        VectorInput5(x: $v2_1, y: $v2_2, z: $v2_3, w: $v2_4, v: $v2_5)
                    }
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
                    var values1: Vector<Double> = []
                    var values2: Vector<Double> = []
                    
                    switch self.vectorSize {
                    case .Three:
                        values1 = [self.v1_1, self.v1_2, self.v1_3]
                        values2 = [self.v2_1, self.v2_2, self.v2_3]
                        break
                    case .Four:
                        values1 = [self.v1_1, self.v1_2, self.v1_3, self.v1_4]
                        values2 = [self.v2_1, self.v2_2, self.v2_3, self.v2_4]
                        break
                    case .Five:
                        values1 = [self.v1_1, self.v1_2, self.v1_3, self.v1_4, self.v1_5]
                        values2 = [self.v2_1, self.v2_2, self.v2_3, self.v2_4, self.v2_5]
                        break
                    }
                    
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
            .navigationBarTitle(Text("Simple Vector Math"))
        }
    }
}

struct VectorMath_Previews: PreviewProvider {
    static var previews: some View {
        VectorMath()
    }
}

enum BasicOperation : String, CaseIterable {
    case Add = "Add"
    case Sub = "Sub"
    case Mult = "Mult"
    case Div = "Div"
}

enum VectorSize : String, CaseIterable {
    case Three = "3"
    case Four = "4"
    case Five = "5"
}

