//
//  DriveProgressLines.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 15/3/22.
//

import SwiftUI

struct DriveProgressLines: View {
    
    var totalProgress: Float
    var dayProgress: Float
    var nightProgress: Float
//
    var body: some View {
        VStack {
            Text(String(totalProgress))
        }
    }
}

struct DriveProgressLines_Previews: PreviewProvider {
    static var previews: some View {
        DriveProgressLines(totalProgress: 0.2, dayProgress: 0.2, nightProgress: 0.2)
    }
}
