//
//  Vehicle.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/6/22.
//

import Foundation

struct Vehicle: Hashable, Codable, Identifiable {
    
    init() {
        id = UUID().uuidString
        vehicleName = ""
    }
    
    var id: String
    var vehicleName: String
}
