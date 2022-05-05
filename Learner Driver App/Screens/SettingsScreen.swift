//
//  SettingsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    
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
                
                Section(header: Text("Management")){
                    Text("Instructors ")
                    Text("Vehicles")
                }
                
                if personalContainer.personal.sdc == false {
                    Section(header: Text("Safer Drivers Course")) {
                        Text("Safer drivers course")
                    }
                }
                
                if personalContainer.personal.sdc == false {
                    Section(header: Text("Hazard Perception Test")) {
                        Text("Hazard Perception Test")
                    }
                }
                
                Section {
                    Text("Submission Completion")
                }
                
                Section(header: Text("Links")) {
                    Link("Learner restrictions", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/learner-driver-licence")!)
                    Link("Safer Drivers Course", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/learner-driver-licence/safer-drivers-course")!)
                    Link("Hazard perception test", destination: URL(string: "https://www.nsw.gov.au/driving-boating-and-transport/driver-and-rider-licences/driver-licences/driver-licence-tests/hazard-perception-test")!)
                    Link("Booking your Ps test", destination: URL(string: "https://www.myrta.com/wps/portal/extvp/myrta/licence/tbs/tbs-login/!ut/p/z1/jZJfT4MwFMW_ij7wKLdsbkMTY_ZHHZM5MjccfTFlXrEKLWkLTD-9RRMfjE771uac05PfvUBhA1SwmmfMcClYbu8J7d-T6UUUrzsDz-_2JiS4HA9G3iLyyNiDGO4-Jb-cIQG6PyGx_sH9LLqI5uHU9xbBiXUdh-NlMJl3rmYdWAupCtvlFijQZ1aznVtKZXI0LtOQkPaZF2XOt9zM5QPmkBhVYfsscGdijg0kKAyqCRrGc20r072trrvfBeQ26JNgtI4X8bDr-as_BFf9L8HvXGZAUylfhivUJpQZFy3toUi7fgZU4SMqVG6l7BCejCn1qUMc0jSNq1HVfIuu0I2bydpllUN-sj5JbWDzs6PVt6kfoarQUZVafksUD6giplihgUrFban1MoSN_bjUDileS7l1iIVal-eV4me2nUIt8xrVqUk1F9z8P3nF7QxhM7IMDtiBsRQ-dmnvLpTFpb-76dU3Ry_L6VuId77ppX52-A6_4eIx/")!)
                }
                
                
        }
            .navigationBarTitle(Text("Settings"))
    }
    
//    func calculatedInitials(personal: Personal) -> String {
//        let initials = personalContainer.personal.usersFirstName.prefix(1) + personalContainer.personal.usersLastName.prefix(1)
//
//        let result = String(initials)
//        return result;
//    }
}

//struct SettingsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsScreen(personalContainer.personal)
//    }
//}
//
//struct SettingsScreen: View {
//    @EnvironmentObject var personalContainer: PersonalContainer
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack{
//                    NavigationLink(destination: EditProfile()) {
//                        ProfileBoxView(
//                            initials: calculatedInitials(personal: personalContainer.personal))
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Settings"))
//        }
//    }
//
//    func calculatedInitials(personal: Personal) -> String {
//        let initials = personalContainer.personal.usersFirstName.prefix(1) + personalContainer.personal.usersLastName.prefix(1)
//
//        let result = String(initials)
//        return result;
//    }
//}
}
