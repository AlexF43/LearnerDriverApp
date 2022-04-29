//
//  EditProfile.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 24/4/22.
//

import SwiftUI

struct EditProfile: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    @State private var licenseNumStr: String = ""
    
    var name: String {
        personalContainer.personal.usersName
    }
    

    var body: some View {
        VStack{
            TextField(personalContainer.personal.usersName, text: $personalContainer.personal.usersName)
            Divider()
            
            TextField("\(personalContainer.personal.licenseInfo)", value: $personalContainer.personal.licenseInfo, formatter: NumberFormatter())
            Divider()
            
        }
    }
    
    func savePersonalInfo() -> Void {
        personalContainer.personal.licenseInfo = Int(licenseNumStr) ?? 0
        personalContainer.editPersonal(personal: personalContainer.personal)
    }
    
    
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
