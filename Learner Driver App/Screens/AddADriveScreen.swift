//
//  addADriveScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/2/22.
//

import SwiftUI
import Combine
import OWOneCall
import CoreLocation

struct AddADriveScreen: View {
    
    @EnvironmentObject var drivesContainer: DrivesContainer
    @EnvironmentObject var supervisorsContainer: SupervisorsContainer
    @EnvironmentObject var vehiclesContainer: VehiclesContainer
    //    drivesContainer.currentDrive = Drive()
    
    @State private var showAlert = false
    @State var isNewDrive: Bool
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""
    //    let locationManager = LocationManager()
    
    @State var locationManager = LocationManager()
    
    var userLatitude: Double {
        return locationManager.lastLocation?.coordinate.latitude ?? 0
    }
    
    var userLongitude: Double {
        return locationManager.lastLocation?.coordinate.longitude ?? 0
    }
    
    let weatherProvider = OWProvider(apiKey: "18d1d8e759fe97b7cc88165748a58ba2")
    let lang = "en"
    let frmt = "yyyy-MM-dd"
    
    @State var weather = OWResponse()
    
    var body: some View {
        
        Form{
            Section(header: Text("General Information")) {
                
                Picker("Vehicle", selection: $drivesContainer.currentDrive.vehicle) {
                    ForEach(vehiclesContainer.vehicles, id: \.id) { vehicle in
                        Text(vehicle.vehicleName).tag(vehicle.id)
                    }
                }
                
                Picker("Supervisor", selection: $drivesContainer.currentDrive.supervisor) {
                    ForEach(supervisorsContainer.supervisors, id: \.id) { supervisor in
                        Text(supervisor.firstName).tag(supervisor.id)
                    }
                }
                
                HStack (spacing: 0) {
                    Text("Weather")
                    Spacer()
                    Text(weather.current?.weather.count ?? 0 > 0 ? (weather.current?.weather[0].main ?? "Retreiveing Weather") : "Retreiveing Weather")
                        .multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Time and Place")) {
                
                HStack (spacing: 0) {
                    Text("Start Time")
                    DatePicker("", selection: $drivesContainer.currentDrive.driveStartDate)
                    //                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
                    //                        .labelsHidden()
                }
                
                HStack (spacing: 0) {
                    Text("End Time")
                    Spacer()
                    DatePicker("", selection: $drivesContainer.currentDrive.driveEndDate)
                    //                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
//                        .padding(0)
                    //                        .labelsHidden()
                }

                

                
                HStack (spacing: 0) {
                    Text("Start Suburb")
                    TextField("End Suburb", text: $drivesContainer.currentDrive.startLocation)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack (spacing: 0) {
                    Text("End Suburb")
                    TextField("End Suburb", text: $drivesContainer.currentDrive.endLocation)
                        .multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Odometer")) {
                
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
                //            }.onAppear(perform: makeNewDriveIfNecessary, perform: requestAlwaysAuthorization())
            }
        } .task {
            if let results = await weatherProvider.getWeather(lat: userLatitude, lon: userLongitude, options: OWOptions(excludeMode: [], units: .metric, lang: "en")) {
                weather = results
                makeNewDriveIfNecessary()
            }
        }
        .navigationTitle("Add a drive")
        
    }
    //        }
    
    //perform: makeNewDriveIfNecessary
    
    fileprivate func isAllDataFilledIn() -> Bool {
        return drivesContainer.currentDrive.supervisor == "" || drivesContainer.currentDrive.vehicle == "" || drivesContainer.currentDrive.startLocation == "" || drivesContainer.currentDrive.endLocation == "" || endOdometerStr == "" || startOdometerStr == ""
    }
    
    func loadData() {
        
        let myOptions = OWOptions(excludeMode: [], units: .metric, lang: "en")
        weatherProvider.getWeather(lat: userLatitude, lon: userLongitude, weather: $weather, options: myOptions)
        
        // for historical data in the past
        //         weatherProvider.getWeather(lat: 35.661991, lon: 139.762735, weather: $weather, options: OWHistOptions.yesterday())
    }
    
    func attemptToSaveDrive() -> Void {
        print("date \(drivesContainer.currentDrive.driveStartDate)")
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
            isNewDrive = false
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


//struct addADriveScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddADriveScreen(isNewDrive: true)
//    }
//}

