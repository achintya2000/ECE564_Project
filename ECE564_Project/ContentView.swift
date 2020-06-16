//
//  ContentView.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/13/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    @State var allOperations = AllOperations.createAllOperationsList()
    @State var allQuickLinks = QuicklinksModel.createQuickLinks()
 
    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                VStack(spacing: 30) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(allQuickLinks, id: \.self) { cardview in
                                cardview.frame(width: UIScreen.screenWidth * 0.8)
                            }
                        }
                    }
                                            
                    List {
                        Section(header: Text("All Operations")) {
                            ForEach(allOperations) { listItem in
                                NavigationLink(destination: listItem.destination) {
                                    Text(listItem.title)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Hello")
            }
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            .tag(0)
            
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(1)
        }
    }
}

struct TEST: View {
    var body: some View {
        Text("This is the detail view")
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        .previewDisplayName("iPhone 11")
    }
}
