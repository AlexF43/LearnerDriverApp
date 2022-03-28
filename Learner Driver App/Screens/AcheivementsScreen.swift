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
                    dayHours: calculateDayHours(drives: drivesContainer.drives),
                    nightHours: calculateNightHours(drives: drivesContainer.drives),
                    exactTotalHours: 1000,
                    totalProgress: calculateTotalProgres(drives: drivesContainer.drives),
                    nightProgress: calculateNightProgres(drives: drivesContainer.drives),
                    dayProgress: calculateDayProgres(drives: drivesContainer.drives)
                )
                
                
            }
            .navigationBarTitle(Text("Achievements"))
        }
    }
    
    //exact hours
    
    func calculateTotalHours(drives: [Drive]) -> Double {
        var hoursDriven = 0.0
        for drive in drives {
            hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
        }
        
        let result = Double(hoursDriven)
        
        return result;
    }
    
    func calculateDayHours(drives: [Drive]) -> Int {
        var hoursDriven = 0.0
        for drive in drives {
            if drive.isDayTime {
                hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
            }
        }
        
        let result = Int(hoursDriven)
        return result;
    }
    
    func calculateNightHours(drives: [Drive]) -> Int {
        var hoursDriven = 0.0
        for drive in drives {
            if drive.isDayTime == false {
                hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
            }
        }
        
        var result = Int(hoursDriven)
        if result > 20 {
            result = 20
        }
        return result;
    }
        
    // Calculated percentages
    
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
struct AcheivementsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AcheivementsScreen()
    }
}

