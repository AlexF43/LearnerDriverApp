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
            
            Text("\(totalProgress)")
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 10)
                   // .trim(from: 0.01, to: 0.2)
                    .frame(width: 350*CGFloat(totalProgress), height:20)
             //   .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
              .rotationEffect(Angle(degrees: 180))
              
                
                RoundedRectangle(cornerRadius: 10)
//                    .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin:  .round))
                    .frame(width: 350, height:20)
                    .opacity(0.3)
                    .foregroundColor(Color.black)
                
            }
//                .frame(width: 200, height: 30)
            
//            Capsule()
//                .frame(width: (value: self.totalProgress,
//                                            maxValue: 1.0,
//                                            Width: 25.0))
//                .foregroundColor(.gray)
//                .animation(.easeIn)
            
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
