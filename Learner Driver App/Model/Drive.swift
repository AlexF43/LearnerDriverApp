//
//  Drives.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import Foundation

struct Drive: Hashable, Codable, Identifiable {
    
    init() {
        id = UUID().uuidString
        vehicle = ""
        supervisor = ""
        startTime = ""
        endTime = ""
        startOdometer = 0
        endOdometer = 0
//        startOdometerStr = ""
//        endOdometerStr = ""
        startLocation = ""
        endLocation = ""
        driveNotes = ""
        isDayTime = false
        Date = ""
    }
    
    var id: String
    var vehicle: String
    var supervisor: String
    var startTime: String
    var endTime: String
    var startOdometer: Int
    var endOdometer: Int
//    var startOdometerStr: String
//    var endOdometerStr: String
    var startLocation: String
    var endLocation: String 
    var driveNotes: String
    var isDayTime: Bool
    var Date: String
//    var time: Int
    
    var distance: Int {
        endOdometer - startOdometer
    }

}




//let time = Drive.startTime.timeIntervalSince(Drive.endTime)
