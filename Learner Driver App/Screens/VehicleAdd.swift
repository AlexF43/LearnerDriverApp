//
//  VehicleAdd.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/6/22.
//

import SwiftUI

struct VehicleAdd: View {
    @EnvironmentObject var vehiclesContainer: VehiclesContainer
    @Environment(\.dismiss) var dismiss
    @State var showAlert = false
    
    var body: some View {
        
        Form{
            Section {
                HStack (spacing: 0) {
                    Text("Vehicle")
                    TextField("Vehicle Name", text: $vehiclesContainer.currentvehicle.vehicleName)
                        .multilineTextAlignment(.trailing)
                }
                
            }
            
            Section(footer:HStack(alignment: .center) {
                Spacer()
                
                Button( action: {
                    if vehiclesContainer.currentvehicle.vehicleName != "" {
                        vehiclesContainer.addvehicle(vehicle: vehiclesContainer.currentvehicle)
                        dismiss()
                    } else {
                        showAlert = true
                    }
                }) {
                    HStack {
                        Text("Save")
                            .fontWeight(.semibold)
                            .font(.title3)
                        //                            Image(systemName: "square.and.arrow.down")
                        //                                .font(.body)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Unable to save vehicle"),
                            message: Text("Please enter the vehicle name into the field")
                        )}
                }
                Spacer()
                
            }) {
                EmptyView()
            }
        } .task {
            vehiclesContainer.currentvehicle = Vehicle()
        }.navigationBarTitle("Add a Vehicle")
    }
}

struct VehicleAdd_Previews: PreviewProvider {
    static var previews: some View {
        VehicleAdd()
    }
}

