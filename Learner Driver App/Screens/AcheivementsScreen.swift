//
//  AcheivementsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI

struct AcheivementsScreen: View {
    @EnvironmentObject var drivesContainer: DrivesContainer
    var body: some View {
        NavigationView {
            ScrollView {
                
                Text("Some pretty cool text")
                DriveProgressLines(
                    totalHours: calculateTotalHours(drives: drivesContainer.drives),
                    dayProgress: calculateDayHours(drives: drivesContainer.drives),
                    nightProgress: calculateNightHours(drives: drivesContainer.drives),
                                                       exactTotalHours: 1000)
                
            }
            .navigationBarTitle(Text("Achievements"))
        }
    }
        func calculateTotalHours(drives: [Drive]) -> Double {
            var hoursDriven = 0.0
            for drive in drives {
                hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
            }
            
            let result = Double(hoursDriven)
            
            return result;
        }
        
        func calculateDayHours(drives: [Drive]) -> Double {
            var hoursDriven = 0.0
            for drive in drives {
                if drive.isDayTime {
                    hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
                }
            }
            
            let result = Double(hoursDriven / 100)
            return result;
        }
        
        func calculateNightHours(drives: [Drive]) -> Double {
            var hoursDriven = 0.0
            for drive in drives {
                if drive.isDayTime == false {
                    hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
                }
            }
            
            var result = Double(hoursDriven / 20)
            if result > 1 {
                result = 1
            }
            return result;
            
            
            
            
            
    
}
    
}
struct AcheivementsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AcheivementsScreen()
    }
}

