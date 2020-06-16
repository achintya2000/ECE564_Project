//
//  StringMatrixView.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/16/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI

struct StringMatrixView: View {
    @State var matrixInput: String = ""
    var body: some View {
        TextField("Matrix", text: self.$matrixInput)
    }
}

struct StringMatrixView_Previews: PreviewProvider {
    static var previews: some View {
        StringMatrixView()
    }
}
