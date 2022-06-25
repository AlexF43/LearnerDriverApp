//
//  Personal.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 25/4/22.
//

import Foundation

extension String {

//    func toDate(withFormat format: String = "yyyy-MM-dd")-> Date? {
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
//        dateFormatter.locale = Locale(identifier: "fa-IR")
//        dateFormatter.calendar = Calendar(identifier: .gregorian)
//        dateFormatter.dateFormat = format
//        let date = dateFormatter.date(from: self)
//
//        return date
//
//    }
}

struct Personal: Hashable, Codable {
    
    
    
    init() {
        dateStr = ""
        usersFirstName = ""
        usersLastName = ""
        licenseInfo = 0
        sdc = false
        hpt = false
        DOB = ""
    }
    var dateStr: String
    var usersFirstName: String
    var usersLastName: String
    var licenseInfo: Int
    var sdc: Bool
    var hpt: Bool
    var DOB: String
    
    
    var DOBDate: Date {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let theDate = dateFormatter.date(from: dateStr) {
                return theDate
            }
            return Foundation.Date()
        } set(newDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateStr = dateFormatter.string(from: newDate)
        }
    }
}
