//
//  addADriveScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/2/22.
//

import SwiftUI
import Combine
import OWOneCall

struct AddADriveScreen: View {
    
    @EnvironmentObject var drivesContainer: DrivesContainer

    @State private var showAlert = false
    @State var isNewDrive: Bool
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""

    let weatherProvider = OWProvider(apiKey: "18d1d8e759fe97b7cc88165748a58ba2")
    let lang = "en"
    let frmt = "yyyy-MM-dd"
    
    @State var weather = OWResponse()
    
    var body: some View {
        Form{
            Section {
                HStack (spacing: 0) {
                    Text(weather.current?.weatherInfo() ?? "")
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
                    Text("Date")
                    DatePicker("", selection: $drivesContainer.currentDrive.driveDate, displayedComponents: .date)
//                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
//                        .labelsHidden()
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
        
            
        Button("Save", action: attemptToSaveDrive)
            .foregroundColor(Color.white)
            .frame(width:70, height:30, alignment: .center)
            .background(Color.blue)
            .border(Color.black, width:2)
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Unable to save drive"),
                        message: Text("Please enter the required infomation into every field")
                        )}
            }.onAppear(perform: makeNewDriveIfNecessary)
        } .task {
            if let results = await weatherProvider.getWeather(lat: 35.661991, lon: 139.762735, options: OWOptions(excludeMode: [], units: .metric, lang: "en")) {
                weather = results
            }
        }
    
    }
    
//perform: makeNewDriveIfNecessary
        
    fileprivate func isAllDataFilledIn() -> Bool {
        return drivesContainer.currentDrive.supervisor == "" || drivesContainer.currentDrive.vehicle == "" || drivesContainer.currentDrive.startLocation == "" || drivesContainer.currentDrive.endLocation == "" || endOdometerStr == "" || startOdometerStr == "" || drivesContainer.currentDrive.startTime == "" || drivesContainer.currentDrive.endTime == ""
    }
    
    func loadData() {
         
         let myOptions = OWOptions(excludeMode: [], units: .metric, lang: "en")
         weatherProvider.getWeather(lat: -33.861536, lon: 151.215206, weather: $weather, options: myOptions)
         
         // for historical data in the past
         //         weatherProvider.getWeather(lat: 35.661991, lon: 139.762735, weather: $weather, options: OWHistOptions.yesterday())
     }
    
    func attemptToSaveDrive() -> Void {
        if isAllDataFilledIn() {
            showAlert = true
            print("equals nil ")
        } else {
            saveDrive()
                print("does not equal")
        }
    }
    
    func makeNewDriveIfNecessary() {
        if isNewDrive {
            drivesContainer.currentDrive = Drive()
        }
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

