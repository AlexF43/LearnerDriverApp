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
        sdc = false
        hpt = false
    }

    var usersFirstName: String
    var usersLastName: String
    var licenseInfo: Int
    var sdc: Bool
    var hpt: Bool
    
}
