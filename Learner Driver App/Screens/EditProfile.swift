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
    

    var body: some View {
        VStack{
            TextField(personalContainer.personal.usersFirstName, text: $personalContainer.personal.usersFirstName)
            Divider()
            
            TextField(personalContainer.personal.usersLastName, text: $personalContainer.personal.usersLastName)
            Divider()
            
            TextField("\(personalContainer.personal.licenseInfo)", value: $personalContainer.personal.licenseInfo, formatter: NumberFormatter())
            Divider()
            
            Button("Save", action: savePersonalInfo)
                .foregroundColor(Color.white)
                .frame(width:70, height:30)
                .background(Color.blue)
                .border(Color.black, width:2)
                
            }
            
        }
//    }

    func savePersonalInfo() -> Void {
//        personalContainer.personal.licenseInfo = Int(licenseNumStr) ?? 0
        personalContainer.savePersonal()
        //take back to setting screen
    }
    
    
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
