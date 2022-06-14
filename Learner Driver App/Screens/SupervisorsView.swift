//
//  SupervisorsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import SwiftUI

struct SupervisorsView: View {
    @EnvironmentObject var SupervisorsContainer: SupervisorsContainer
//    var supervisor: Supervisor

    var body: some View {
//        List(SupervisorsContainer.supervisors) { Supervisor in
                SupervisorsRow(supervisor: Supervisor)
//            }
        ForEach(SupervisorsContainer.supervisors, id: \.self) { drive in
//            ZStack {
//                Rectangle()
//            SupervisorRow(supervisor: Supervisor)
//            }
        }
    }
}

//struct SupervisorsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SupervisorsView()
//    }
//}
