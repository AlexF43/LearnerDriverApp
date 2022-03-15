//
//  AcheivementsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct AcheivementsScreen: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                DriveProgressLines(totalProgress: 0.6, dayProgress: 0.2, nightProgress: 0.7)
            }
            .navigationBarTitle(Text("Acheivements"))
        }
    }
}

struct AcheivementsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AcheivementsScreen()
    }
}
