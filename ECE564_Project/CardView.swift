//
//  CardView.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/13/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI

struct CardView: View, Hashable {
    //var image: String
    var category: String
    var heading: String
    var caption: String
    var color: Color
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(nil)
                    Text(caption.uppercased())
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
        }
        .background(color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(category: "Category: Vectors", heading: "Finding a pair of Vector's Dot Product", caption: "Quicklink to calculator", color: Color.init(red: 255/255, green: 153/255, blue: 153/255))
    }
}
