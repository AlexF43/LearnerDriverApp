//
//  addADriveScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/2/22.
//

import SwiftUI
import Combine

struct AddADriveScreen: View {
    
    @EnvironmentObject var drivesContainer: DrivesContainer
    
    @State private var drive = Drive()
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""
    
//    var id: Int
//    var vehicle: String
//    var supervisor: String
//    var startTime: String
//    var endTime: String
//    var startOdometer: Int
//    var endOdometer: Int
//    var startLocation: String
//    var endLocation: String
//    var driveNotes: String
//    var isDayTime: Bool
//    var Date: String
//    var time: Int
//
//    @State private var $distance: Int = 0 {
//        drive.endOdometer - drive.startOdometer
//    }
//
    var body: some View {
        VStack {
            
//            HStack {
//                Text("\($drive.distance)")
//
//                Text("time should go here")
//            }
            
            
                ZStack{
                    
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:380, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                    HStack (spacing: 0) {
                        Text("Instructor").padding()
                        Spacer(minLength: 160)
                        
                        TextField("Instructor", text: $drive.supervisor)
                }
            }
            
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("Vehicle").padding()
                    Spacer(minLength: 180)
            TextField("Vehicle", text: $drive.vehicle)
                }
            }
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("Suburbs").padding()
                    Spacer(minLength: 1)
                   // Text("yuh").padding()
                    Text("\(drive.startLocation) to \(drive.endLocation)").padding()
                   // TextField("Suburbs", text: ("\($drive.startLocation) to \($drive.endLocation)")
                }}
            
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("Start Location").padding()
                    Spacer(minLength: 140)
            TextField("Start Location", text: $drive.startLocation)
                }}
            
            
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("End Location").padding()
                    Spacer(minLength: 160)
            TextField("End Location", text: $drive.endLocation)
                }
            }
            
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("Start Odometer")
                        .padding()
                        .frame(width:170, height:20)
                        .border(Color.black, width: 1)
                    Spacer(minLength: 79)
                    TextField("Start Odometer", text: $startOdometerStr)
                
            
                .keyboardType(.numberPad)
//                .onReceive(Just(startOdometerStr)) { newValue in
//                    let filtered = newValue.filter { "0123456789".contains($0) }
//                    if filtered != newValue {
//                        self.startOdometerStr = filtered
//                    }
               // }
                }}
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("End Odometer").padding()
                    Spacer(minLength: 160)
            TextField("End Odometer", text: $endOdometerStr)
                .keyboardType(.numberPad)
                .onReceive(Just(endOdometerStr)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.endOdometerStr = filtered
                    }
                }
                }}
            
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("Start time").padding()
                    Spacer(minLength: 160)
            TextField("Start Time", text: $drive.startTime)
                }}
            ZStack{
                
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.3)
                    .frame(width:380, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                HStack (spacing: 0) {
                    Text("End Time").padding()
                    Spacer(minLength: 160)
            TextField("End Time", text: $drive.endTime)
                }}
        }
        Button("Save", action: save)
            .foregroundColor(Color.white)
            .frame(width:70, height:30)
            .background(Color.blue)
           
            .border(Color.black, width:2)
            
//        .title("Add a drive")
    }
    func save() -> Void {
        drive.startOdometer = Int(startOdometerStr) ?? 0
        drive.endOdometer = Int(endOdometerStr) ?? 0
        drivesContainer.addDrive(drive: drive)
    }
}


struct addADriveScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddADriveScreen()
    }
}

