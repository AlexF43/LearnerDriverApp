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
        Form {
            Section(header: Text("Personal Infomation")) {
                HStack (spacing: 0) {
                    Text("First Name")
                    TextField(personalContainer.personal.usersFirstName, text: $personalContainer.personal.usersFirstName)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack (spacing: 0) {
                    Text("Last Name")
                    TextField(personalContainer.personal.usersLastName, text: $personalContainer.personal.usersLastName)
                        .multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Lisence info")) {
                HStack (spacing: 0) {
                    Text("Date")
                    DatePicker("", selection: $personalContainer.personal.DOBDate, displayedComponents: .date)
                    //                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
                    //                        .labelsHidden()
                }
                
            }
                
            
           
            TextField("\(personalContainer.personal.licenseInfo)", value: $personalContainer.personal.licenseInfo, formatter: NumberFormatter())
            
            Button("Save", action: savePersonalInfo)
                .foregroundColor(Color.white)
                .frame(width:70, height:30)
                .background(Color.blue)
                .border(Color.black, width:2)
            
                
            }
        .navigationTitle("Edit Infomation")
            
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
