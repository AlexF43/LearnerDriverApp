//
//  SupervisorsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import SwiftUI

struct SupervisorsView: View {
    @EnvironmentObject var supervisorsContainer: SupervisorsContainer
//    var supervisor: Supervisor

    var body: some View {

        ForEach(supervisorsContainer.supervisors, id: \.self) { supervisor in
//            ZStack {
//                Rectangle()
            SupervisorRow(supervisor: supervisor)
//            }
        }
    }
}

//struct SupervisorsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SupervisorsView()
//    }
//}
