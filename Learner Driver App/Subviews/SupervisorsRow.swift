//
//  SupervisorsRow.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import SwiftUI

struct SupervisorsRow: View {
    var supervisor: Supervisor
    
    var body: some View {
        Text("Come and eat at \(supervisor.firstName)")
    }
}

//struct SupervisorsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SupervisorsRow()
//    }
//}
