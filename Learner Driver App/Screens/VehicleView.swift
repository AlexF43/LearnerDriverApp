//
//  VehicleView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/6/22.
//

import SwiftUI

struct VehiclesView: View {
    @EnvironmentObject var vehiclesContainer: VehiclesContainer

    var body: some View {
        List {
            Section {
                ForEach(vehiclesContainer.vehicles, id: \.self) { vehicle in
                    VehicleRow(vehicle: vehicle)
                }
                .onDelete(perform: delete)
            }
            Section(footer:
                        HStack(alignment: .center) {
                Spacer()

                NavigationLink {
                        VehicleAdd()
                } label: {
                        HStack {
                            Image(systemName: "plus")
                                .font(.body)
                            Text("Add")
                                .fontWeight(.semibold)
                                .font(.title3)
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
        }
        
        .navigationTitle("vehicles")
        .toolbar {
            EditButton()
                
    }
    
}
    
    
//

        
    
    
    
    func delete(at offsets: IndexSet) {
        if let min = offsets.min() {
            vehiclesContainer.deletevehicle(atPosition: min)
        }
    }
}
