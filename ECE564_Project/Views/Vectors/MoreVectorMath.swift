//
//  MoreVectorMath.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Surge
import simd

struct MoreVectorMath: View {
    @State var output = ""
    @State var operation : AdvancedOperation = .Dot
    
    @State var v1_1 = 0.0
    @State var v1_2 = 0.0
    @State var v1_3 = 0.0
    
    @State var v2_1 = 0.0
    @State var v2_2 = 0.0
    @State var v2_3 = 0.0
            
    var body: some View {
        Form {
            Section(header: Text("Vector 1")) {
                HStack {
                    Spacer()
                    VectorInput3(x: $v1_1, y: $v1_2, z: $v1_3)
                    Spacer()
                }
            }
            Section(header: Text("Vector 2")) {
                HStack {
                    Spacer()
                    VectorInput3(x: $v2_1, y: $v2_2, z: $v2_3)
                    Spacer()
                }
            }
            Section(header: Text("asdf")) {
                Picker(selection: $operation, label: Text("")) {
                    ForEach(AdvancedOperation.allCases, id: \.self) { op in
                        Text(op.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            HStack {
                Spacer()
                Button(action: {
                    switch self.operation {
                    case .Dot:
                        let values1: Vector<Double> = [self.v1_1, self.v1_2, self.v1_3]
                        let values2: Vector<Double> = [self.v2_1, self.v2_2, self.v2_3]
                        
                        let dot = Surge.dot(values1, values2)
                        self.output = "\(dot)"
                        break
                    case .Cross:
                        let v1 = simd_double3(self.v1_1, self.v1_2, self.v1_3)
                        let v2 = simd_double3(self.v2_1, self.v2_2, self.v2_3)
                        
                        let cross = simd.cross(v1, v2)
                        self.output = "\(cross.x), \(cross.y), \(cross.z)"
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
            .navigationBarTitle(Text("More Vector Math"))
        }
    }
}

struct MoreVectorMath_Previews: PreviewProvider {
    static var previews: some View {
        MoreVectorMath()
    }
}

enum AdvancedOperation : String, CaseIterable {
    case Dot = "Dot Product"
    case Cross = "Cross Product"
}
