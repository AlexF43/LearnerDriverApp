//
//  SettingsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                        
                Text("Settings screen")
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
