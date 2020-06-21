//
//  LineChart.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/20/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import Charts

struct Line: UIViewRepresentable {
    @Binding var entries: [ChartDataEntry]
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        
    }
    
    func addData() -> LineChartData {
        let set1 = LineChartDataSet(entries: entries)
        let data = LineChartData(dataSet: set1)
        return data
    }
    
    typealias UIViewType = LineChartView
}


