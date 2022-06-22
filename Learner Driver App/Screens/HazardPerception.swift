//
//  HazardPerception.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 22/6/22.
//

import SwiftUI

struct HazardPerception: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    @State private var showAlert = false
    
    var body: some View {
        Form {
            
            Section(header: Text("Infomation")) {
                Text("The Hazard Perception Test (or HPT) is a computer-based test that you need to pass before you can take the driving test and get your provisional P1 licence")
            }
            
            Section {
                if personalContainer.personal.hpt == false { //make pop up to confirm on click
                    Button("Sign Off") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Confirm hazard percpeption sign off"),
                                message: Text("This action is permanent cannot be undone"),
                                primaryButton: .cancel(),
                                secondaryButton: .default(Text("Okay"), action: {
                                    personalContainer.personal.hpt = true
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
                Link("More information", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/driver-licence-tests/hazard-perception-test")!)
                Link("Hazard Perception Handbook", destination: URL(string: "https://www.nsw.gov.au/sites/default/files/2021-08/hazard-perception-handbook.pdf")!)
                Link("Hazard Perception Handbook", destination: URL(string: "https://www.myrta.com/wps/portal/extvp/myrta/licence/tbs/tbs-login/")!)
                
            }
            
        }
        .navigationTitle("Hazard Perception")
    }
    func savePersonalInfo() -> Void {
//        personalContainer.personal.licenseInfo = Int(licenseNumStr) ?? 0
        personalContainer.savePersonal()
        //take back to setting screen
    }
}

struct HazardPerception_Previews: PreviewProvider {
    static var previews: some View {
        HazardPerception()
    }
}
