//
//  QuicklinksModel.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/15/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import Foundation
import SwiftUI


class QuicklinksModel {
    
    class quickLinkPair: Identifiable {
        let id = UUID()
        let cardView: CardView
        let destination: AnyView
            
        init(card: CardView, destination: AnyView) {
            self.cardView = card
            self.destination = destination
        }
    }
    
    static func createQuickLinks() -> [quickLinkPair] {
        var quickLinksModel = [quickLinkPair]()
    
        quickLinksModel.append(quickLinkPair(card: CardView(category: "Category: Vectors", heading: "Finding a pair of Vector's Dot Product", caption: "Quicklink to calculator", color: Color.init(red: 137/255, green: 207/255, blue: 240/255)), destination: AnyView(MoreVectorMath())))

        quickLinksModel.append(quickLinkPair(card: CardView(category: "Category: Vectors", heading: "Find the Cross Product of Two Vectors", caption: "Quicklink to calculator", color: Color.init(red: 255/255, green: 153/255, blue: 153/255)), destination: AnyView(MoreVectorMath())))
    
        return quickLinksModel
    }
}

