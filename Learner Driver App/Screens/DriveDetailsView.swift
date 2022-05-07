//
//  DriveDetailsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/1/22.
//

import SwiftUI
import CoreData
import Combine

struct DriveDetailsView: View {
    
    @EnvironmentObject var drivesContainer: DrivesContainer
    @Environment(\.managedObjectContext) private var viewContext
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""
//    @State var drive: Drive

    var body: some View {
        Form{
            Section {
                HStack (spacing: 0) {
                    Text("Instructor")
                    TextField("Instructor", text: $drivesContainer.currentDrive.supervisor)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack (spacing: 0) {
                    Text("Vehicle")
                    TextField("Vehicle", text: $drivesContainer.currentDrive.vehicle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack (spacing: 0) {
                    Text("Start Suburb")
                    TextField("Start Suburb", text: $drivesContainer.currentDrive.startLocation)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack (spacing: 0) {
                    Text("End Suburb")
                    TextField("End Suburb", text: $drivesContainer.currentDrive.endLocation)
                        .multilineTextAlignment(.trailing)
                }
                
                
                HStack (spacing: 0) {
                    Text("Start Odometer")
                    TextField("Start Odometer", text: $startOdometerStr)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .onReceive(Just(startOdometerStr)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.startOdometerStr = filtered
                            }
                        }
                }
                
                HStack (spacing: 0) {
                    Text("End Odometer")
                    TextField("End Odometer", text: $endOdometerStr)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .onReceive(Just(endOdometerStr)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.endOdometerStr = filtered
                            }
                        }
                    
                }

                
                HStack (spacing: 0) {
                    Text("Start Time")
                    TextField("Start Time", text: $drivesContainer.currentDrive.startTime)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack (spacing: 0) {
                    Text("End Time")
                    TextField("End Time", text: $drivesContainer.currentDrive.endTime)
                        .multilineTextAlignment(.trailing)
                }
//        ScrollView {
//            VStack (spacing: 0) {
//                HStack (spacing: 0) {
//                    ZStack{
//                        Rectangle()
//                            .fill(Color.gray)
//                            .opacity(0.3)
//                            .frame(width:185, height:35)
//                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//                        Text("\(drivesContainer.currentDrive.distance) km")
//                            .fontWeight(.bold)
//                    }
//
//                    ZStack{
//                        Rectangle()
//                            .fill(Color.gray)
//                            .opacity(0.3)
//                            .frame(width:185, height:35)
//                            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//                    Text( "Drive time")
//                        .fontWeight(.bold)
//
//                    }
//                }
//                .padding(.top)
//                .font(.title3)
//
//                Spacer(minLength: 15)
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("Vehicle")
//                            .padding(13)
//                    Spacer()
//
//                    Text(drivesContainer.currentDrive.vehicle)
//                            .padding(13)
//                    }
//                }
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("Supervisor")
//                            .padding(13)
//                    Spacer()
//
//                    Text(drivesContainer.currentDrive.supervisor)
//                            .padding(13)
//                    }
//                }
//
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("Start location")
//                            .padding(13)
//                    Spacer()
//
//                    Text(drivesContainer.currentDrive.startLocation)
//                            .padding(13)
//                    }
//                }
//
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("End location")
//                            .padding(13)
//                    Spacer()
//
//                    Text(drivesContainer.currentDrive.endLocation)
//                            .padding(13)
//                    }
//                }
//
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("Start odometer")
//                            .padding(13)
//                    Spacer()
//
//                    Text("\(drivesContainer.currentDrive.startOdometer)")
//                            .padding(13)
//                    }
//                }
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("End odometer")
//                            .padding(13)
//                    Spacer()
//
//                    Text("\(drivesContainer.currentDrive.endOdometer)")
//                            .padding(13)
//                    }
//                }
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("Start time")
//                            .padding(13)
//                    Spacer()
//
//                    Text(drivesContainer.currentDrive.startTime)
//                            .padding(13)
//                    }
//                }
//
//                ZStack{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.3)
//                        .frame(width:370, height:50)
//                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
//
//                    HStack {
//                        Text("End Time")
//                            .padding(13)
//                    Spacer()
//
//                    Text(drivesContainer.currentDrive.endTime)
//                            .padding(13)
//                    }
//                }
                
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
