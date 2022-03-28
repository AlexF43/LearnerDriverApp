//
//  DriveProgressLines.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 15/3/22.
//

import SwiftUI

struct DriveProgressLines: View {
    
    var totalHours: Double
    var dayHours: Int
    var nightHours: Int
    let exactTotalHours: Double
    var totalProgress: Float
    var nightProgress: Float
    var dayProgress: Float
    
    var body: some View {
       
        let totalSeconds = Int(totalHours * 3600)
        let totalRoundedHours = totalSeconds/3600
        let totalRemainderSeconds = totalSeconds % 3600
        let totalMins = totalRemainderSeconds * 60

        
        VStack {
//            Text(String("total", totalProgress))
            
            if totalMins == 0 {
                
                Text("\(totalRoundedHours) / 120 hours")
                
            } else {
                
                Text("\(totalRoundedHours) hours and \(totalMins) mins / 120 hours")
            }
            
            Rectangle()
                .trim(from: 0.0, to: CGFloat(min(self.totalProgress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 0.0))
            
            Capsule()
                .frame(width: self.progress(value: self.totalProgress,
                                            maxValue: 1.0,
                                            Width: 25.0))
                .foregroundColor(self.foregroundColor)
                .animation(.easeIn)
            
            Text("\(dayHours) / 100 hours")
            
            Text("\(nightHours) / 20 hours")
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
        DriveProgressLines(totalHours: 0.4, dayHours: 1, nightHours: 2, exactTotalHours: 1000, totalProgress: 0.1, nightProgress: 0.2, dayProgress: 0.3)
    }
}
