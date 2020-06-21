//
//  ODE.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/19/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Charts

struct ODE: View {
    @State var start: Double = 0.0
    @State var end: Double = 0.0
    @State var initial: Double = 0.0
    @State var result: String = ""
    @State var pointsArray = [ChartDataEntry]()
    @State var presentGraph = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("End points")) {
                    HStack {
                        TextField("Start", value: $start, formatter: NumberFormatter())
                        TextField("End", value: $end, formatter: NumberFormatter())
                    }
                }
                Section(header: Text("Initial Value")) {
                    HStack {
                        Text("x(0)=")
                        TextField("num", value: $initial, formatter: NumberFormatter())
                    }
                }
                Section(header: Text("Submit")) {
                    Button(action: {
                        self.pointsArray.removeAll()
                        self.result = ODESolver_Wrapper().odeSolver_Solve(self.start, end: self.end, initialVal: self.initial)
                                                
                        let resultArray = self.result.split(separator: ",")
                                                
                        for pair in resultArray {
                            let values = pair.split(separator: ":")
                            let doubleValues = values.compactMap(Double.init)
                            self.pointsArray.append(ChartDataEntry(x: doubleValues[0], y: doubleValues[1]))
                        }
                        self.presentGraph.toggle()
                    }) {
                        Text("Submit")
                    }.sheet(isPresented: $presentGraph) {
                        Line(entries: self.$pointsArray).frame(height: UIScreen.screenHeight * 0.5)
                    }
                }
                .navigationBarTitle(Text("1st Order ODE (Limited)"))
            }
        }
    }
}

struct ODE_Previews: PreviewProvider {
    static var previews: some View {
        ODE()
    }
}
