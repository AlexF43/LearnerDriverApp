//
//  Drives.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import Foundation

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd")-> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

struct Drive: Hashable, Codable, Identifiable {
    
    init() {
        id = UUID().uuidString
        dateStartStr = ""
        dateEndStr = ""
        vehicle = ""
        supervisor = ""
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
    
    var dateStartStr: String
    var dateEndStr: String// date String for storage in the JSON.
    var id: String
    var vehicle: String
    var supervisor: String
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
    
    // this function allows us to access dateStartStr as a Date object
    // so it will work with things like date pickers
    var driveStartDate: Date {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            if let theDate = dateFormatter.date(from: dateStartStr) {
                return theDate
            } 
            return Foundation.Date()
        } set(newDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            dateStartStr = dateFormatter.string(from: newDate)
        }
    }
    
    var driveEndDate: Date {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let theDate = dateFormatter.date(from: dateEndStr) {
                return theDate
            }
            return Foundation.Date()
        } set(newDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateEndStr = dateFormatter.string(from: newDate)
        }
    }
    
    
    // formatted date for display to the user
    var formattedStartDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: driveStartDate)
    
    }
    
//    var dateAsString: String {
//
//    }
}




//let time = Drive.startTime.timeIntervalSince(Drive.endTime)
