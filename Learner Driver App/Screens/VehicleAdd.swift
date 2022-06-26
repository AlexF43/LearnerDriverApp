//
//  VehicleAdd.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/6/22.
//

import SwiftUI

struct VehicleAdd: View {
    @EnvironmentObject var vehiclesContainer: VehiclesContainer
    
    var body: some View {
        
        Form{
            Section {
                HStack (spacing: 0) {
                    Text("Instructor")
                    TextField("Instructor", text: $vehiclesContainer.currentvehicle.vehicleName)
                        .multilineTextAlignment(.trailing)
                }
                
            }
            
            Section(footer:HStack(alignment: .center) {
                Spacer()
                
                Button( action: {
                    vehiclesContainer.addvehicle(vehicle: vehiclesContainer.currentvehicle)
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
                }
                Spacer()
                
            }) {
                EmptyView()
            }
        } .task {
            vehiclesContainer.currentvehicle = Vehicle()
        }
    }
}

struct VehicleAdd_Previews: PreviewProvider {
    static var previews: some View {
        VehicleAdd()
    }
}

