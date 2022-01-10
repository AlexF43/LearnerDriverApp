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
                    Text("\(drive.distance) km")
                        .fontWeight(.bold)
                    Spacer()
                    Text( "Drive time")
                        .fontWeight(.bold)
                }
                .font(.title3)

                Spacer()
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
                HStack {
                    Text("Supervisor:")
                    Spacer()
                    Text( "\(drive.distance)")
                }
            }
            .padding()
        }
        .navigationTitle("Drive on \(drive.Date)")
    }
}

struct DriveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriveDetailsView(drive: drives[0]) 
    }
}
