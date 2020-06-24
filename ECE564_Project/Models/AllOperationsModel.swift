//
//  AllOperationsModel.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import Foundation
import SwiftUI

// Class for adding the different operations to the home screen
class AllOperations {
    
    class ListItem : Identifiable {
        let id = UUID()
        let title: String
        let destination: AnyView
            
        init(title: String, destination: AnyView) {
            self.title = title
            self.destination = destination
        }
    }
    
    // Adds all operations to the operations home page list
    static func createAllOperationsList() -> [ListItem] {
        var AllOperations = [ListItem]()
        
        AllOperations.append(ListItem(title: "Basic Vector Math", destination: AnyView(VectorMath())))
        
        AllOperations.append(ListItem(title: "More Vector Math", destination: AnyView(MoreVectorMath())))
        
        AllOperations.append(ListItem(title: "Basic Matrix Math", destination: AnyView(StringMatrixView())))
        
        AllOperations.append(ListItem(title: "Matrix Multiplication", destination: AnyView(MatrixMulView())))
        
        AllOperations.append(ListItem(title: "Solve System of Equations", destination: AnyView(MatrixSystemSolver())))
        
        AllOperations.append(ListItem(title: "V Limited 1st order ODE", destination: AnyView(ODE())))
        
        AllOperations.append(ListItem(title: "Solve System of Differential Equations", destination: AnyView(SystemSolver())))
        
        AllOperations.append(ListItem(title: "Analytic solutions to Differential Equations", destination: AnyView(AnalyticDiffEq())))
        
        return AllOperations
    }

}

