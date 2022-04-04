//
//  DriveProgressLines.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 15/3/22.
//

import SwiftUI

struct DriveProgressLines: View {
    
    var totalHours: Int
    var dayHours: Int
    var nightHours: Int
    let exactTotalHours: Double
    var totalProgress: Float
    var nightProgress: Float
    var dayProgress: Float
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
                
            Text("Total \(totalHours)/120 hours")
                .bold()
            
            ZStack(alignment: .leading){
                
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: 350, height: 22)
                    .opacity(1)
                    .foregroundColor(Color.white)
                
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black,lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green))
                    .frame(width: 350 * CGFloat(totalProgress), height: 20)

            }

            
            Text("Day \(dayHours)/100 hours")
                .bold()
            
            ZStack(alignment: .leading){
                
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: 350, height: 22)
                    .opacity(1)
                    .foregroundColor(Color.white)
                
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black,lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.yellow))
                    .frame(width: 350 * CGFloat(dayProgress), height: 20)
                
            }
            
            Text("Night \(nightHours)/20 hours")
                .bold()
            
            ZStack(alignment: .leading){
                
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: 350, height: 22)
                    .opacity(1)
                    .foregroundColor(Color.white)
                
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black,lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue))
                    .frame(width: 350 * CGFloat(nightProgress), height: 20)

            }
        }
    }
}

struct DriveProgressLines_Previews: PreviewProvider {
    static var previews: some View {
        DriveProgressLines(totalHours: 4, dayHours: 1, nightHours: 2, exactTotalHours: 1000, totalProgress: 0.1, nightProgress: 0.2, dayProgress: 0.3)
    }
}
