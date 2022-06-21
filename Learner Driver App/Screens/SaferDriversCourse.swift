//
//  SaferDriversCourse.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 21/6/22.
//

import SwiftUI

struct SaferDriversCourse: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    
    var body: some View {
        Form {
            
            Section(header: Text("Infomation")) {
                Text("The NSW Safer Drivers Course teaches learner drivers under 25 to develop safe driving skills and prepare for driving solo. This course can help you understand speed management, gap selection, hazard awareness, safe following distances, and how to keep driving safely when you get distracted.")
            }
            
            Section {
                if personalContainer.personal.sdc == false {
                    Text("Sign off")
                } else {
                    Text("Completed")
                }
            } header: {
                Text("Sign Off")
            } footer: {
                Text("Once signed off this action cannot be undone")
            }
            
            Section(header: Text("Related links")) {
                
            }
            
        }
        .navigationTitle("Safer Drivers Course")
    }
}

struct SaferDriversCourse_Previews: PreviewProvider {
    static var previews: some View {
        SaferDriversCourse()
    }
}
