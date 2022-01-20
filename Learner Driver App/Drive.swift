//
//  Drives.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import Foundation

struct Drive: Hashable, Codable, Identifiable {
    
    var id: Int
    var vehicle: String
    var supervisor: String
    var startTime: String
    var endTime: String
    var startOdometer: Int
    var endOdometer: Int
    var startLocation: String
    var endLocation: String 
    var driveNotes: String
    var isDayTime: Bool
    var Date: String
//    var time: Int
    
    var Time: String {
        Date()
    }
    
    var distance: Int {
        endOdometer - startOdometer
    }

}




//let time = Drive.startTime.timeIntervalSince(Drive.endTime)
