//
//  VehicleRow.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/6/22.
//

import SwiftUI

struct VehicleRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    var vehicle: Vehicle
    var body: some View {
        Text(vehicle.vehicleName)
    }
}

