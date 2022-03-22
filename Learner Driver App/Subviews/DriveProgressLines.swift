//
//  DriveProgressLines.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 15/3/22.
//

import SwiftUI

struct DriveProgressLines: View {
    
    var totalHours: Double
    var dayProgress: Double
    var nightProgress: Double
    let exactTotalHours: Double
    
    var body: some View {
       
        let totalSeconds = Int(totalHours * 3600)
        let totalRoundedHours = totalSeconds/3600
        let totalRemainderSeconds = totalSeconds % 3600
        let totalMins = totalRemainderSeconds * 60
        
        
        VStack {
//            Text(String("total", totalProgress))
            
            if totalMins == 0{
                
                Text("\(totalRoundedHours) / 120 hours")
                
            } else {
                
                Text("\(totalRoundedHours) hours and \(totalMins) mins / 120 hours")
            }
        }
    }
}
//
//func totalHours(drives: [Drive]) -> Double {
//    var hoursDriven = 0.0
//    hoursDriven = 120 * totalProgress
//
    


struct DriveProgressLines_Previews: PreviewProvider {
    static var previews: some View {
        DriveProgressLines(totalHours: 0.4, dayProgress: 0.3, nightProgress: 0.2, exactTotalHours: 1000)
    }
}
