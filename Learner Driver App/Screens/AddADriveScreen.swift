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
    
//    @State var drive: Drive
    @State var isNewDrive: Bool
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""
    
//
    var body: some View {
        Form{
            Section {
                VStack {
            
            
                ZStack{
                    
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.3)
                        .frame(width:380, height:50)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                    HStack (spacing: 0) {
                        Text("Instructor").padding()
                        Spacer(minLength: 160)
                        
                        TextField("Instructor", text: $drivesContainer.currentDrive.supervisor)
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
            TextField("Vehicle", text: $drivesContainer.currentDrive.vehicle)
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
                    Text("\(drivesContainer.currentDrive.startLocation) to \(drivesContainer.currentDrive.endLocation)").padding()
                   // TextField("Suburbs", text: ("\($drivesContainer.currentDrive.startLocation) to \($drivesContainer.currentDrive.endLocation)")
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
            TextField("Start Location", text: $drivesContainer.currentDrive.startLocation)
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
            TextField("End Location", text: $drivesContainer.currentDrive.endLocation)
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
                .onReceive(Just(startOdometerStr)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.startOdometerStr = filtered
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
            TextField("Start Time", text: $drivesContainer.currentDrive.startTime)
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
            TextField("End Time", text: $drivesContainer.currentDrive.endTime)
                }}
        }
        Button("Save", action: saveDrive)
            .foregroundColor(Color.white)
            .frame(width:70, height:30)
            .background(Color.blue)
            .border(Color.black, width:2)
            }
        }
            
//        .title("Add a drive")
    }
    func saveDrive() -> Void {
        drivesContainer.currentDrive.startOdometer = Int(startOdometerStr) ?? 0
        drivesContainer.currentDrive.endOdometer = Int(endOdometerStr) ?? 0
        if isNewDrive {
            drivesContainer.addDrive(drive: drivesContainer.currentDrive)
        } else {
            drivesContainer.saveCurrentDrive()
        }
    }
}


struct addADriveScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddADriveScreen(isNewDrive: true)
    }
}

