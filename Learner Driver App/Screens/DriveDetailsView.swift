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
    @State private var editingState: String = "Edit"
    @State private var isEditing: Bool = true
    @State private var startOdometerStr: String = ""
    @State private var endOdometerStr: String = ""
    @State private var showAlert = false
//    @State var drive: Drive

    var body: some View {
        Form{
            Section {
                HStack (spacing: 0) {
                    Text("Instructor")
                    TextField("Instructor", text: $drivesContainer.currentDrive.supervisor)
                        .multilineTextAlignment(.trailing)
                        .disabled(isEditing)
                }
                
                HStack (spacing: 0) {
                    Text("Vehicle")
                    TextField("Vehicle", text: $drivesContainer.currentDrive.vehicle)
                        .multilineTextAlignment(.trailing)
                        .disabled(isEditing)
                }
                
                HStack (spacing: 0) {
                    Text("Date")
                    DatePicker("", selection: $drivesContainer.currentDrive.driveStartDate, displayedComponents: .date)
//                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
//                        .labelsHidden()
                }
                
                HStack (spacing: 0) {
                    Text("Start Suburb")
                    TextField("Start Suburb", text: $drivesContainer.currentDrive.startLocation)
                        .multilineTextAlignment(.trailing)
                        .disabled(isEditing)
                }
                
                HStack (spacing: 0) {
                    Text("End Suburb")
                    TextField("End Suburb", text: $drivesContainer.currentDrive.endLocation)
                        .multilineTextAlignment(.trailing)
                        .disabled(isEditing)
                }
                
                
                HStack (spacing: 0) {
                    Text("Start Odometer")
                    TextField("Start Odometer", text: $startOdometerStr)
                        .multilineTextAlignment(.trailing)
                        .disabled(isEditing)
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
                        .disabled(isEditing)
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
            }
        
        }
        .onAppear(perform: initialiseStrings)
        .navigationTitle("Drive on \(drivesContainer.currentDrive.Date)")
        .toolbar {
            Button(editingState, action: editPressed)
//            NavigationLink(destination: AddADriveScreen(isNewDrive: false)) {
//                Text("Edit")
        }
        
    }
        
    func editPressed() -> Void {
        if editingState == "Edit" {
            isEditing = false
            editingState = "Delete"
        } else {
            drivesContainer.deleteCurrentDrive()
        }
        
    }
    
    func initialiseStrings() -> Void {
        startOdometerStr = String(drivesContainer.currentDrive.startOdometer)
        endOdometerStr = String(drivesContainer.currentDrive.endOdometer)
    }

    fileprivate func isAllDataFilledIn() -> Bool {
        return drivesContainer.currentDrive.supervisor == "" || drivesContainer.currentDrive.vehicle == "" || drivesContainer.currentDrive.startLocation == "" || drivesContainer.currentDrive.endLocation == "" || endOdometerStr == "" || startOdometerStr == ""
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

    func saveDrive() -> Void {
        drivesContainer.saveCurrentDrive()
    }
}

struct DriveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriveDetailsView()
    }
}
