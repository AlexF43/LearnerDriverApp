//
//  SettingsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    NavigationLink(destination: EditProfile()) {
                        ProfileBoxView(
                            initials: calculatedInitials(personal: personalContainer.personal))
                    }
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
    func calculatedInitials(personal: Personal) -> String {
        var name: String {
            personalContainer.personal.usersName
        }
        
        let result = name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        return result;
    }
}

//struct SettingsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsScreen(personalContainer.personal)
//    }
//}
