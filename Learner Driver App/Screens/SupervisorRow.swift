//
//  SupervisorRow.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 30/5/22.
//

import SwiftUI

struct SupervisorRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    var supervisor: Supervisor
    var body: some View {
        Text(supervisor.firstName)
    }
}

