//
//  DriveProgressBars.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 20/1/22.


import UIKit
import SwiftUI
//import CloudKit

struct DriveProgressBars: View {
    var totalProgress: Float
    var dayProgress: Float
    var nightProgress: Float
    
//    var dayHoursCompleted: Int
//    var nighHoursCompleted: Int
//    var totalHoursCompleted: Int
//    let totalHoursRequired: Int = 120
//    let dayHoursRequired: Int = 100
//    let nightHoursRequired: Int = 20
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 29.0)
                .opacity(1.0)
                .foregroundColor(Color.black)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.totalProgress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
//                .animation(.easeInOut)
            
            Text(String(format: "%.0f %%", min(self.totalProgress, 1.0)*100.0))
                .font(.title)
//                .bold()
            ZStack {
                    Circle()
                        .stroke(lineWidth: 26.1)
                        .opacity(1.0)
                        .foregroundColor(Color.black)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.dayProgress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle(degrees: 270.0))
    //                .animation(.easeInOut)
                
                ZStack {
                        Circle()
                            .stroke(lineWidth: 26.1)
                            .opacity(1.0)
                            .foregroundColor(Color.black)
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(self.nightProgress, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.blue)
                        .rotationEffect(Angle(degrees: 270.0))
        //                .animation(.easeInOut)
                }
                .padding(26)
            }
            .padding(26)
        }
    }
}


struct DriveProgressBars_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            DriveProgressBars(totalProgress: 0.2, dayProgress: 0.2, nightProgress: 0.2)
//            Spacer()
        }
//        .previewLayout(.fixed(width: 300, height: 70))
    }
}
