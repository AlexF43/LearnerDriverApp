//
//  SettingsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject var PersonalContainer: PersonalContainer
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    NavigationLink(destination: EditProfile(personal: PersonalContainer().personals)) {
                        ProfileBoxView()
                    }
                }
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
