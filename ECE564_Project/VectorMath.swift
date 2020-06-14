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
    
    var body: some View {
        Form {
            Section(header: Text("Addition")) {
                HStack {
                    Text("Hi")
                }
            }
            .navigationBarTitle("Vector Math")
        }.onAppear {
            self.doWork()
        }
    }
    
    func doWork() {
        let c = Surge.dot(values1, values2)
        print(c)
    }
}

struct VectorMath_Previews: PreviewProvider {
    static var previews: some View {
        VectorMath()
    }
}

