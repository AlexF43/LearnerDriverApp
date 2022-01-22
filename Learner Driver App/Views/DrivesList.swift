//
//  DrivesList.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import SwiftUI

struct DrivesList: View {
    var body: some View {
        NavigationView {
                
            VStack {
                
                ZStack {
                    Color.yellow
                        .opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                
                    VStack {
                        DriveProgressBars(progress: calculateProgres(drives: drives)
//                                          0.3
                        )
                            .frame(width: 150.0, height: 150.0)
                            .padding(40.0)
                    
                        Spacer()
                    }
                }
                
                
                Text("Drives")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                
                List(drives) { drive in
                    NavigationLink {
                        DriveDetailsView(drive: drive)
                    } label: {
                        DrivesRow(drive: drive)
    //                    Text("Drive Row belongs here")
                    }
                
                }
                
            }
        }
    }
    
    func calculateProgres(drives: [Drive]) -> Float {
        var hoursDriven = 0.0
        for drive in drives {
            hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
        }
        
        let result = Float(hoursDriven / 120)
        return result;
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) {deviceName in
        DrivesList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
