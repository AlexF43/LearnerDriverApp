//
//  Personal.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 25/4/22.
//

import Foundation

struct Personal: Hashable, Codable {
    
    init() {
        usersFirstName = ""
        usersLastName = ""
        licenseInfo = 0
        sdc = true
    }

    var usersFirstName: String
    var usersLastName: String
    var licenseInfo: Int
    var sdc: Bool
    
//    print("https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid={API key}")
}
