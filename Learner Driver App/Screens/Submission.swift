//
//  Submission.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 22/6/22.
//

import SwiftUI

struct Submission: View {
    var body: some View {
        Form {
            Section(header: Text("Requirements")) {
                Text("Total hours:")
                Text("Night hours:")
                Text("Hazards:")
            }
            
            Section(header: Text("Optionals")) {
                Text("Safer Drivers:")
            }
        }
        .navigationTitle("Submission")
    }
}

struct Submission_Previews: PreviewProvider {
    static var previews: some View {
        Submission()
    }
}
