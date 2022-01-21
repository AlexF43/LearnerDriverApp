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
            List(drives) { drive in
                NavigationLink {
                    DriveDetailsView(drive: drive)
                } label: {
                    DrivesRow(drive: drive)
//                    Text("Drive Row belongs here")
                }
            }
            .navigationTitle("Drives")
        }
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
