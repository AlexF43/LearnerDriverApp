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
    @Environment(\.dismiss) var dismiss
    @State var showAlert = false
    

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
                
                HStack (spacing: 0) {
                    Text("Date")
                    DatePicker("", selection: $personalContainer.personal.DOBDate, displayedComponents: .date)
                    //                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
                    //                        .labelsHidden()
                }
            }
            
            Section(header: Text("license info")) {
                HStack {
                Text("license Number")
                TextField("12345678", value: $personalContainer.personal.licenseInfo, formatter: NumberFormatter())
                    .multilineTextAlignment(.trailing)
                }
            }
                
            
            Section(footer:
                        HStack(alignment: .center) {
                Spacer()

                Button(action: savePersonalInfo) {
                        HStack {
                            Image(systemName: "plus")
                                .font(.body)
                            Text("Save")
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Unable to save"),
                                message: Text("Please check all infomation has been entered")
                            )}
                }
                Spacer()
            }) {
                EmptyView()
            }

            
                
            }
        .navigationTitle("Edit Infomation")
            
        }
//    }

    func savePersonalInfo() -> Void {
//        personalContainer.personal.licenseInfo = Int(licenseNumStr) ?? 0
        if personalContainer.personal.usersFirstName != "" && personalContainer.personal.usersLastName != "" && personalContainer.personal.licenseInfo != 1 {
            personalContainer.savePersonal()
            dismiss()
        } else  {
            showAlert = true
        }
        //take back to setting screen
    }
    
    
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfile()
//    }
//}
