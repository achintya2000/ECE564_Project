//
//  Settings.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/23/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI

struct Settings: View {

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: Binding<Bool>(
                    get: { UserDefaults.standard.integer(forKey: "LastStyle") !=
                                UIUserInterfaceStyle.light.rawValue },
                    set: {
                        SceneDelegate.shared?.window!.overrideUserInterfaceStyle = $0 ? .dark : .light
                        UserDefaults.standard.setValue($0 ? UIUserInterfaceStyle.dark.rawValue : UIUserInterfaceStyle.light.rawValue, forKey: "LastStyle")
                    }
                 )) {
                     Text("Toggle Color Mode")
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
