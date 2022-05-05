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
//    @State var drive: Drive

    var body: some View {
        ScrollView {
            VStack (spacing: 0) {
                HStack (spacing: 0) {
                    ZStack{
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.3)
                            .frame(width:185, height:35)
                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                        Text("\(drivesContainer.currentDrive.distance) km")
                            .fontWeight(.bold)
                    }
                        
                    ZStack{
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.3)
                            .frame(width:185, height:35)
                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                    Text( "Drive time")
                        .fontWeight(.bold)
                        
                    }
                }
                .padding(.top)
                .font(.title3)

                Spacer(minLength: 15)
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("Vehicle")
                            .padding(13)
                    Spacer()
                        
                    Text(drivesContainer.currentDrive.vehicle)
                            .padding(13)
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("Supervisor")
                            .padding(13)
                    Spacer()
                        
                    Text(drivesContainer.currentDrive.supervisor)
                            .padding(13)
                    }
                }
                
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("Start location")
                            .padding(13)
                    Spacer()
                        
                    Text(drivesContainer.currentDrive.startLocation)
                            .padding(13)
                    }
                }
                
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("End location")
                            .padding(13)
                    Spacer()
                        
                    Text(drivesContainer.currentDrive.endLocation)
                            .padding(13)
                    }
                }
                
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("Start odometer")
                            .padding(13)
                    Spacer()
                        
                    Text("\(drivesContainer.currentDrive.startOdometer)")
                            .padding(13)
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("End odometer")
                            .padding(13)
                    Spacer()
                        
                    Text("\(drivesContainer.currentDrive.endOdometer)")
                            .padding(13)
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("Start time")
                            .padding(13)
                    Spacer()
                        
                    Text(drivesContainer.currentDrive.startTime)
                            .padding(13)
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:370, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                                
                    HStack {
                        Text("End Time")
                            .padding(13)
                    Spacer()
                        
                    Text(drivesContainer.currentDrive.endTime)
                            .padding(13)
                    }
                }
                
            }
//            .padding()
        }
        .navigationTitle("Drive on \(drivesContainer.currentDrive.Date)")
        .toolbar {
            NavigationLink(destination: AddADriveScreen(isNewDrive: false)) {
                Text("Edit")
            }
        }
    }
}

struct DriveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriveDetailsView()
    }
}
