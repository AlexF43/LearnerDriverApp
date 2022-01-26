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
            VStack (spacing: 0) {
                
                ZStack {
                    Color.gray
                        .opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 300)
                
                    HStack {
                        Spacer()
                        DriveProgressBars(progress: calculateProgres(drives: drives))
                            .frame(width: 200.0, height: 200.0)
                            .padding(0.0)
                        
                        VStack {
                            Spacer()
                                .padding(.vertical, 30.0)
                            
                            AddADriveButton()
                                .padding(.horizontal)
                                .padding(.top, 30)
                        }

                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                ZStack {
                    Color.gray
                        .opacity(0.1)
                        .frame(height: 50)
                    HStack {
                        Text("Drives")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer()
                    }
                }
                
                List(drives) { drive in
                    NavigationLink {
                        DriveDetailsView(drive: drive)
                    } label: {
                        DrivesRow(drive: drive)
                    }
                
                }
                NavigationBar()
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
        .navigationBarHidden(true)
    }
}
