//
//  NavigationBar.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 11/1/22.
//

import SwiftUI

struct NavigationBar: View {
    
    var body: some View {
        HStack {
            Image("Acheivements icon")
            Image("MainMenu icon")
            Image("Settings icon")
        }

            Spacer()
    }
}


struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBar()
            Spacer()
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

