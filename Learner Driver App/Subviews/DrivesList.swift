//
//  DrivesList.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import SwiftUI

struct DrivesList: View {
    @State var navigated = false
    
    @EnvironmentObject var drivesContainer: DrivesContainer
    
    @State private var isPresenting = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 0) {
                    
                    ZStack {
                        Color.white
                            .opacity(0.1)
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 300)
                    
                        HStack {
                            Spacer()
                            DriveProgressBars(
                                totalProgress: calculateTotalProgres(drives: drivesContainer.drives),
                                dayProgress: calculateDayProgres(drives: drivesContainer.drives),
                                nightProgress: calculateNightProgres(drives: drivesContainer.drives)
                            )
                                .frame(width: 200.0, height: 200.0)
                                .padding(0.0)
                            
                            VStack {
                                
                            Spacer()
                                .padding(.vertical, 30.0)
                        
//                                NavigationLink {
//                                   AddADriveScreen()
//
//                                } label: {
//                                   AddADriveButton()
//                                            .padding()
                                    
//                                }
                                
                                
                                NavigationLink(destination: AddADriveScreen(isNewDrive: true)) {
                                    AddADriveButton()
                                }
                                .padding()
                                
//                                Button (action: {
//                                      isPresenting.toggle()
//                                }) {
//                                    AddADriveButton()
//                                         .padding()
//                                }
//                                  .fullScreenCover(isPresented: $isPresenting,
//                                                   onDismiss: didDismiss) {
//
//
//
//                                      VStack {
//                                          Spacer(minLength: 40)
//                                          HStack {
//                                              Image(systemName: "chevron.backward")
//                                                  .foregroundColor(Color.blue)
//                                          Spacer()
//                                              Text("Add a drive")
//                                                  .font(.title)
//                                                  .foregroundColor(Color.black)
//                                              Spacer()
//                                          }
//                                          .frame(width: 200)
//                                      }
//                                      .frame(height: 50)
//                                      .onTapGesture {
//                                          isPresenting.toggle()
//                                      }
//                                      .frame(height: 50)
//
////                                      .foregroundColor(.white)
////                                      .background(Color.)
//                                      .ignoresSafeArea(edges: .all)
//                                            AddADriveScreen(isNewDrive: true)
                                            
                                      
                                
                            }
                        }
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                    Divider()
                    
                    ZStack {
                        Color.white
                            .opacity(0.1)
                            .frame(height: 50)
                        HStack {
                            Text("Your Drives")
                                .underline()
                                .font(.title)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                    }
                    
                    ForEach(drivesContainer.drives, id: \.self) { drive in
                        NavigationLink {
                            DriveDetailsView()
                       } label: {
                           DrivesRow(drive: drive)
                       }
                       .padding(.horizontal)
                       .simultaneousGesture(TapGesture().onEnded({
                           drivesContainer.currentDrive = drive
                       }))
                    }

                    Divider()
                }
            }
        }
//        NavigationBar()
//            .frame(height: 40)
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
    
    func calculateTotalProgres(drives: [Drive]) -> Float {
        var hoursDriven = 0.0
        for drive in drives {
            hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
        }
        
        let result = Float(hoursDriven / 120)
        return result;
    }
    
    func calculateDayProgres(drives: [Drive]) -> Float {
        var hoursDriven = 0.0
        for drive in drives {
            if drive.isDayTime {
                hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
            }
        }
        
        let result = Float(hoursDriven / 100)
        return result;
    }
    
    func calculateNightProgres(drives: [Drive]) -> Float {
        var hoursDriven = 0.0
        for drive in drives {
            if drive.isDayTime == false {
                hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
            }
        }
        
        var result = Float(hoursDriven / 20)
        if result > 1 {
            result = 1
        }
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
