//
//  MatrixView.swift
//  ECE564_Project
//
//  Created by Sebastian Williams on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI

struct MatrixView: View {
    @State var aa: Double = 0
    @State var ab: Double = 0
    @State var ac: Double = 0
    @State var ad: Double = 0
    @State var ae: Double = 0
    @State var af: Double = 0
    @State var ag: Double = 0
    @State var ba: Double = 0
    @State var bb: Double = 0
    @State var bc: Double = 0
    @State var bd: Double = 0
    @State var be: Double = 0
    @State var bf: Double = 0
    @State var bg: Double = 0
    @State var ca: Double = 0
    @State var cb: Double = 0
    @State var cc: Double = 0
    @State var cd: Double = 0
    @State var ce: Double = 0
    @State var cf: Double = 0
    @State var cg: Double = 0
    @State var da: Double = 0
    @State var db: Double = 0
    @State var dc: Double = 0
    @State var dd: Double = 0
    @State var de: Double = 0
    @State var df: Double = 0
    @State var dg: Double = 0
    @State var ea: Double = 0
    @State var eb: Double = 0
    @State var ec: Double = 0
    @State var ed: Double = 0
    @State var ee: Double = 0
    @State var ef: Double = 0
    @State var eg: Double = 0
    @State var fa: Double = 0
    @State var fb: Double = 0
    @State var fc: Double = 0
    @State var fd: Double = 0
    @State var fe: Double = 0
    @State var ff: Double = 0
    @State var fg: Double = 0
    @State var ga: Double = 0
    @State var gb: Double = 0
    @State var gc: Double = 0
    @State var gd: Double = 0
    @State var ge: Double = 0
    @State var gf: Double = 0
    @State var gg: Double = 0
    
    @ObservedObject var rowcol: MatrixSize
    
    var body: some View {
        VStack {
            HStack {
                ForEach(self.rowcol.numCol, id: \.self) {col in
                    VStack {
                        ForEach(self.rowcol.numRow, id: \.self) {_ in
                            TextField("Hello", value: self.$aa, formatter: NumberFormatter())
                        }
                    }
                    
                }
            }
            VStack {
                //Text(rowcol.numCol.description)
                Button(action: {
                    self.rowcol.numCol.append(0)
                    print(self.rowcol.numCol)
                    self.rowcol.objectWillChange.send()
                })
                {
                    Text("Add col")
                }
                Button(action: {
                    self.rowcol.numRow.append(0)
                    self.rowcol.objectWillChange.send()
                })
                {
                    Text("Add row")
                }
            }
        }
        
        
    
        
        
        
    }
}

struct MatrixView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixView(rowcol: MatrixSize())
    }
}
