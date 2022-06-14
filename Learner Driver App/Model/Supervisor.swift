//
//  Supervisor.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import Foundation

struct Supervisor: Hashable, Codable, Identifiable {
    
    init() {
        id = UUID().uuidString
        firstName = ""
    }
    
    var id: String
    var firstName: String
}
