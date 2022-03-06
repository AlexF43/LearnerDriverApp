//
//  NavigationBar.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 11/1/22.
//

import SwiftUI

struct NavigationBar: View {
    
    var body: some View {
//        NavigationView {
            HStack {
                Spacer()
                .frame(width: 10, height: 60)
            
            NavigationLink {
               AcheivementsScreen()
            } label: {
            Image("Acheivements icon")
                .resizable()
                .frame(width: 50, height: 50)
                Spacer()
            }
            
            NavigationLink {
               DrivesList()
            } label: {
                Image("MainMenu icon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    Spacer()
            }
            
            NavigationLink {
               SettingsScreen()
            } label: {
                Image("Settings icon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    Spacer()
                    .frame(width: 10)
            }
        }
        .background(Color.gray)
    }
//    }
}


struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBar()
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}

