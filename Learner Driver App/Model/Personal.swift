//
//  Personal.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 25/4/22.
//

import Foundation

struct Personal: Hashable, Codable, Identifiable {
    
    init() {
        id = 0
        usersName = ""
        licenseInfo = ""
    }
    
    var id: Int
    var usersName: String
    var licenseInfo: String
}
