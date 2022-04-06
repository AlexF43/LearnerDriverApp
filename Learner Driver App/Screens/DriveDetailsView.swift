//
//  DriveDetailsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/1/22.
//

import SwiftUI
import CoreData

struct DriveDetailsView: View {
    
    @EnvironmentObject var drivesContainer: DrivesContainer
    @Environment(\.managedObjectContext) private var viewContext
    var drive: Drive
    
    var body: some View {
        ScrollView {
            VStack { 
                HStack {
                    ZStack{
                        Rectangle()
                                    .fill(Color.gray)
                                    .opacity(0.3)
                                    .frame(width:160, height:30)
                                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 3))
                    Text("\(drive.distance) km")
                        .fontWeight(.bold)
                    }
                    
                            
                    Spacer()
                    ZStack{
                        Rectangle()
                                    .fill(Color.gray)
                                    .opacity(0.3)
                                    .frame(width:160, height:30)
                                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 3))
                    Text( "Drive time")
                        .fontWeight(.bold)}
                }
                .font(.title3)

                Spacer()
                ZStack{
                    Rectangle()
                                .fill(Color.gray)
                                .opacity(0.3)
                                .frame(width:.infinity, height:50)
                                
                                .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 3))
                                
                    HStack {
            
                        Text("Vehicle")
                            .padding()
                    Spacer()
                        
                    Text(drive.vehicle)
                            .padding()
                    }}
                HStack {
                    Text("Supervisor")
                    Spacer()
                    Text(drive.supervisor)
                }
                HStack {
                    Text("Start Location")
                    Spacer()
                    Text( "\(drive.startLocation)")
                }
                HStack {
                    Text("Final Location")
                    Spacer()
                    Text( "\(drive.endLocation)")
                }
                HStack {
                    Text("Start Odometer")
                    Spacer()
                    Text( "\(drive.startOdometer)")
                }
                HStack {
                    Text("End Odometer")
                    Spacer()
                    Text( "\(drive.endOdometer)")
                }
                HStack {
                    Text("Start Time")
                    Spacer()
                    Text( "\(drive.startTime)")
                }
                HStack {
                    Text("End Time")
                    Spacer()
                    Text( "\(drive.endTime)")
                }
                
            }
            .padding()
        }
        .navigationTitle("Drive on \(drive.Date)")
    }
}

struct DriveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriveDetailsView(drive: DrivesContainer().drives[0])
    }
}
