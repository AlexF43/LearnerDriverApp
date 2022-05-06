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
    
    @State var isNewDrive: Bool
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""
    
//
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
        
            
        Button("Save", action: saveDrive)
            .foregroundColor(Color.white)
            .frame(width:70, height:30, alignment: .center)
            .background(Color.blue)
            .border(Color.black, width:2)
            }
        }
    }
        
            
//        .title("Add a drive")
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

