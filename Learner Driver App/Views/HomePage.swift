//
//  HomePage.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 21/1/22.
//

import SwiftUI

struct HomePage: View {
    
    var body: some View {
        VStack {
            DriveProgressBars(dayHoursCompleted: 40, nighHoursCompleted: 10, totalHoursCompleted: 50)
            DrivesList()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
