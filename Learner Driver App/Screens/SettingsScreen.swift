//
//  SettingsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    //    @ObservedObject var SupervisorsContainer: SupervisorsContainer
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    NavigationLink(destination: EditProfile()) {
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(Color.gray)
                                    .opacity(0.2)
                                    .frame(width: 100)
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width:100)
                                Text(personalContainer.personal.usersFirstName.prefix(1) + personalContainer.personal.usersLastName.prefix(1))
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 45))
                            }
                            .frame( height: 100)
                            VStack (alignment: .leading){
                                
                                Text(personalContainer.personal.usersFirstName + " " + personalContainer.personal.usersLastName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 30).bold())
                                Text("View and edit your profile")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                }
                
                Section(header: Text("Management")) {
                    NavigationLink(destination: Submission()) {
                        Section(header: Text("Submission Requirments")) {     // completion percentatage at end of screen next to <
                            // on this page have like 20/20 night, 120/120 normal hpt - completed
    //                        Text("Submission Completion")
                        }
                    }
                    
                    NavigationLink(destination: SupervisorsView()) {
                        Section(header: Text("Supervisors")) {     // completion percentatage at end of screen next to <
                            // on this page have like 20/20 night, 120/120 normal hpt - completed
    //                        Text("Submission Completion")
                        }
                    }
                    
                    NavigationLink(destination: VehiclesView()) {
                        Section(header: Text("Vehicles")) {     // completion percentatage at end of screen next to <
                            // on this page have like 20/20 night, 120/120 normal hpt - completed
    //                        Text("Submission Completion")
                        }
                    }
                }
                
                Section(header: Text("Courses")) {
    //                if personalContainer.personal.sdc == false { // and hours > 50
                        NavigationLink(destination: SaferDriversCourse()) {
                            Section(header: Text("Safer Drivers Course")) {
                            }
                        }
    //                }
                    
    //                if personalContainer.personal.hpt == false {    //  new hpt item in personal and date since license < 10 months
                    NavigationLink(destination: HazardPerception()) {
                        Section(header: Text("Hazard Perception Test")) {
                        }
                    }
                }
//                }
                
                Section(header: Text("Links")) {
                    Link("Learner restrictions", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/learner-driver-licence")!)
                    Link("Booking your Ps test", destination: URL(string: "https://www.myrta.com/wps/portal/extvp/myrta/licence/tbs/tbs-login/!ut/p/z1/jZJfT4MwFMW_ij7wKLdsbkMTY_ZHHZM5MjccfTFlXrEKLWkLTD-9RRMfjE771uac05PfvUBhA1SwmmfMcClYbu8J7d-T6UUUrzsDz-_2JiS4HA9G3iLyyNiDGO4-Jb-cIQG6PyGx_sH9LLqI5uHU9xbBiXUdh-NlMJl3rmYdWAupCtvlFijQZ1aznVtKZXI0LtOQkPaZF2XOt9zM5QPmkBhVYfsscGdijg0kKAyqCRrGc20r072trrvfBeQ26JNgtI4X8bDr-as_BFf9L8HvXGZAUylfhivUJpQZFy3toUi7fgZU4SMqVG6l7BCejCn1qUMc0jSNq1HVfIuu0I2bydpllUN-sj5JbWDzs6PVt6kfoarQUZVafksUD6giplihgUrFban1MoSN_bjUDileS7l1iIVal-eV4me2nUIt8xrVqUk1F9z8P3nF7QxhM7IMDtiBsRQ-dmnvLpTFpb-76dU3Ry_L6VuId77ppX52-A6_4eIx/")!)
                }
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}
