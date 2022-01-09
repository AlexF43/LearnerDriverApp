//
//  DrivesRow.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import SwiftUI

struct DrivesRow: View {
    var drive: Drive
    
    var body: some View {
        HStack {
            if (drive.isDayTime == true) {
                Image("Daytime")
                .resizable()
                .frame(width: 50, height: 50)
            }
            else {
                Image("Nighttime")
                .resizable()
                .frame(width: 50, height: 50)
            }
            VStack {
                Text(drive.vehicle)
            }
            
            Spacer()
        }
    }
}

struct DrivesRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrivesRow(drive:  drives[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

