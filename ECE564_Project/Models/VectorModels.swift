//
//  VectorModels.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI

// Structs for vector input for basic vector math
struct VectorInput3: View {
    @Binding var x: Double
    @Binding var y: Double
    @Binding var z: Double
        
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
        }
    }
}

struct VectorInput4: View {
    @Binding var x: Double
    @Binding var y: Double
    @Binding var z: Double
    @Binding var w: Double
        
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

struct VectorInput5: View {
    @Binding var x: Double
    @Binding var y: Double
    @Binding var z: Double
    @Binding var w: Double
    @Binding var v: Double
        
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
            TextField("0", value: $v, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .frame(width: 25)
                .keyboardType(.numberPad)
        }
    }
}
