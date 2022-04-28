//
//  EditProfile.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 24/4/22.
//

import SwiftUI

struct EditProfile: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    
    var name: String {
        personalContainer.personal.usersName
    }

    var body: some View {
        VStack{
            TextField(personalContainer.personal.usersName, text: $personalContainer.personal.usersName)
            Text(name)
        }
    }
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
