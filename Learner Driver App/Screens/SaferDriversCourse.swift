//
//  SaferDriversCourse.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 21/6/22.
//

import SwiftUI

struct SaferDriversCourse: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    @State private var showAlert = false
    
    var body: some View {
        Form {
            
            Section(header: Text("Infomation")) {
                Text("The NSW Safer Drivers Course teaches learner drivers under 25 to develop safe driving skills and prepare for driving solo. This 5 hour couse is equivalent to 20 hours of driving")
            }
            
            Section {
                if personalContainer.personal.sdc == false { //make pop up to confirm on click
                    Button("Sign Off") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Confirm safer drivers sign off"),
                                message: Text("This action is permanent cannot be undone"),
                                primaryButton: .cancel(),
                                secondaryButton: .default(Text("Okay"), action: {
                                    personalContainer.personal.sdc = true
                                    savePersonalInfo()
                                }))
                        }
                } else {
                    Text("Completed")
                }
            } header: {
                Text("Sign Off")
            }
            
            
            Section(header: Text("Related links")) {
                Link("More information", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/learner-driver-licence/safer-drivers-course")!)
                Link("Find a course", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/learner-driver-licence/find-safer-drivers-course-providers")!)
            }
            
        }
        .navigationTitle("Safer Drivers Course")
    }
    func savePersonalInfo() -> Void {
//        personalContainer.personal.licenseInfo = Int(licenseNumStr) ?? 0
        personalContainer.savePersonal()
        //take back to setting screen
    }
    
}

struct SaferDriversCourse_Previews: PreviewProvider {
    static var previews: some View {
        SaferDriversCourse()
    }
}
