//
//  EditProfile.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 24/4/22.
//

import SwiftUI

struct EditProfile: View {
    @EnvironmentObject var PersonalContainer: PersonalContainer
    
    var personal: Personal
    
    var body: some View {
        Text(personal.usersName)
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(personal: PersonalContainer().personals[0])
    }
}
