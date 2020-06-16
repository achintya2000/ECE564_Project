//
//  AllOperationsModel.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import Foundation
import SwiftUI


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
    
    static func createAllOperationsList() -> [ListItem] {
        var AllOperations = [ListItem]()
        
        AllOperations.append(ListItem(title: "Basic Vector Math", destination: AnyView(VectorMath())))
        AllOperations.append(ListItem(title: "More Vector Math", destination: AnyView(VectorMath())))
        AllOperations.append(ListItem(title: "Matrix Math", destination: AnyView(MatrixView(rowcol: MatrixSize()))))
        
        return AllOperations
    }

}

