//
//  DriveProgressBars.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 20/1/22.


import UIKit
import SwiftUI
import CloudKit

struct DriveProgressBars: View {
    var dayHoursCompleted: Int
    var nighHoursCompleted: Int
    var totalHoursCompleted: Int
    let totalHoursRequired: Int = 120
    let dayHoursRequired: Int = 100
    let nightHoursRequired: Int = 20
    
    
    var body: some View {
        // Turns out progress view only does little animation
        ProgressView(value: 0.2)
            .progressViewStyle(CircularProgressViewStyle())
        
        // let's try
        // https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
    }
}


struct DriveProgressBars_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DriveProgressBars(dayHoursCompleted: 40, nighHoursCompleted: 10, totalHoursCompleted: 50)
            Spacer()
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
