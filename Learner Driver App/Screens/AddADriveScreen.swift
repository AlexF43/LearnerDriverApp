//
//  addADriveScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/2/22.
//

import SwiftUI
import Combine

struct AddADriveScreen: View {
    
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
//    var distance: Int {
//        endOdometer - startOdometer
//    }
    var body: some View {
        VStack {
            Button("Save", action: save)
            
            TextField("Instructor", text: $drive.supervisor)
            
            TextField("Vehicle", text: $drive.vehicle)
            
            TextField("Start Location", text: $drive.startLocation)
            
            TextField("End Location", text: $drive.endLocation)
            
            TextField("Start Odometer", text: $startOdometerStr)
                .keyboardType(.numberPad)
                .onReceive(Just(startOdometerStr)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.startOdometerStr = filtered
                    }
                }
            
            TextField("End Odometer", text: $endOdometerStr)
                .keyboardType(.numberPad)
                .onReceive(Just(endOdometerStr)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.endOdometerStr = filtered
                    }
                }
            
            TextField("Start Time", text: $drive.startTime)
            
            TextField("End Time", text: $drive.endTime)
        }
    }
    func save() -> Void {
        print("value of label is " + startOdometerStr)
//        startOdometerStr = "99999"
    }
}

struct addADriveScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddADriveScreen()
    }
}
