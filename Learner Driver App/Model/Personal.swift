//
//  Personal.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 25/4/22.
//

import Foundation

struct Personal: Hashable, Codable {
    
    init() {
        usersName = ""
        licenseInfo = 0
    }

    var usersName: String
    var licenseInfo: Int
}
