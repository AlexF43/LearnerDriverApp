//
//  DriveDetailsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/1/22.
//

import SwiftUI
import CoreData

struct DriveDetailsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    var drive: Drive
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Vehicle:")
                    Spacer()
                    Text(drive.vehicle)
                }
                HStack {
                    Text("Supervisor:")
                    Spacer()
                    Text(drive.supervisor)
                }
            }
            .padding()
        }
        .navigationTitle("Drive on")
    }
}

struct DriveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriveDetailsView(drive: drives[0])
    }
}
