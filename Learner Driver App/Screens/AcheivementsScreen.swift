//
//  AcheivementsScreen.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/3/22.
//

import SwiftUI
import Foundation

struct AcheivementsScreen: View {
    @EnvironmentObject var drivesContainer: DrivesContainer
    @EnvironmentObject var personalContainer: PersonalContainer
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                
                
//                Text("Some pretty cool text")
               // HStack {
                    
                DriveProgressLines(
                    totalHours: calculateTotalHours(drives: drivesContainer.drives),
                    dayHours: calculateDayHours(drives: drivesContainer.drives),
                    nightHours: calculateNightHours(drives: drivesContainer.drives),
                    exactTotalHours: 1000,
                    totalProgress: calculateTotalProgres(drives: drivesContainer.drives),
                    nightProgress: calculateNightProgres(drives: drivesContainer.drives),
                    dayProgress: calculateDayProgres(drives: drivesContainer.drives))
                    
                    AchievementCirclesView(
                        totalHours: calculateTotalHours(drives: drivesContainer.drives),
                        dayHours: calculateDayHours(drives: drivesContainer.drives),
                        nightHours: calculateNightHours(drives: drivesContainer.drives),
                        AchievedTotal: false, AchievedDay: false, AchievedNight: true)
                    

                .padding()
                    
                .navigationBarTitle(Text("Achievements"))
            
                }
            }
        }
    }
    
    public func calculateTotalHours(drives: [Drive]) -> Int {
        
        var currentDriveMins: DateComponents
        var runningTotalMinuites = 0
        
        for drive in drives {
            
            currentDriveMins = Calendar.current.dateComponents([.minute], from: drive.driveStartDate, to: drive.driveEndDate)
            let currentDriveMinsInt = currentDriveMins.minute ?? 0
            if currentDriveMinsInt > 0 {
                runningTotalMinuites += currentDriveMinsInt
            }
        }
        
        var totalHours = runningTotalMinuites / 60
        
        if personalContainer.personal.sdc == true {
            totalHours = totalHours + 20
        }
        
        if totalHours > 120 {
            totalHours = 120
        }
        
            let result = totalHours
            return result;
    }
    
    func calculateDayHours(drives: [Drive]) -> Int {
        
        var currentDriveMins: DateComponents
        var runningTotalMinuites = 0
        
        for drive in drives {
            if drive.isDayTime == true {
                currentDriveMins = Calendar.current.dateComponents([.minute], from: drive.driveStartDate, to: drive.driveEndDate)
                let currentDriveMinsInt = currentDriveMins.minute ?? 0
                if currentDriveMinsInt > 0 {
                    runningTotalMinuites += currentDriveMinsInt
                }
            }
        }
        
        var totalHours = runningTotalMinuites / 60
        
        if personalContainer.personal.sdc == true {
            totalHours = totalHours + 20
        }
        
        if totalHours > 100 {
            totalHours = 100
        }
        let result = totalHours
        return result;
    }
    
    func calculateNightHours(drives: [Drive]) -> Int {
        
        var currentDriveMins: DateComponents
        var runningTotalMinuites = 0
        
        for drive in drives {
            if drive.isDayTime == false {
                currentDriveMins = Calendar.current.dateComponents([.minute], from: drive.driveStartDate, to: drive.driveEndDate)
                let currentDriveMinsInt = currentDriveMins.minute ?? 0
                if currentDriveMinsInt > 0 {
                    runningTotalMinuites += currentDriveMinsInt
                }
            }
        }
        
        var totalHours = runningTotalMinuites / 60
        
        if totalHours > 20 {
            totalHours = 20
        }
        let result = totalHours
        return result;

    }
        
    
    func calculateTotalProgres(drives: [Drive]) -> Float {
        var currentDriveMins: DateComponents
        var runningTotalMinuites = 0
        
        for drive in drives {
                currentDriveMins = Calendar.current.dateComponents([.minute], from: drive.driveStartDate, to: drive.driveEndDate)
                let currentDriveMinsInt = currentDriveMins.minute ?? 0
                if currentDriveMinsInt > 0 {
                    runningTotalMinuites += currentDriveMinsInt
                }
        }
        
        var totalHours = Double(runningTotalMinuites / 60)
        if personalContainer.personal.sdc == true {
            totalHours = totalHours + 20
        }
        
        if totalHours > 120 {
            totalHours = 120
        }
        
        let result = totalHours / 120.0
        return Float(result);
    }
    
    func calculateDayProgres(drives: [Drive]) -> Float {
        var currentDriveMins: DateComponents
        var runningTotalMinuites = 0
        
        for drive in drives {
            if drive.isDayTime == true {
                currentDriveMins = Calendar.current.dateComponents([.minute], from: drive.driveStartDate, to: drive.driveEndDate)
                let currentDriveMinsInt = currentDriveMins.minute ?? 0
                if currentDriveMinsInt > 0 {
                    runningTotalMinuites += currentDriveMinsInt
                }
            }
        }
        
        var totalHours = Double(runningTotalMinuites / 60)
        
        if personalContainer.personal.sdc == true {
            totalHours = totalHours + 20
        }
        
        if totalHours > 100 {
            totalHours = 100
        }
        
        let result = totalHours / 120.0
        return Float(result);
    }
    
    func calculateNightProgres(drives: [Drive]) -> Float {
        var currentDriveMins: DateComponents
        var runningTotalMinuites = 0
        
        for drive in drives {
            if drive.isDayTime == false {
                currentDriveMins = Calendar.current.dateComponents([.minute], from: drive.driveStartDate, to: drive.driveEndDate)
                let currentDriveMinsInt = currentDriveMins.minute ?? 0
                if currentDriveMinsInt > 0 {
                    runningTotalMinuites += currentDriveMinsInt
                }
            }
        }
        
        var totalHours = Double(runningTotalMinuites / 60)
        
        
        if totalHours > 20 {
            totalHours = 20
        }
        
        let result = totalHours / 20.0
        return Float(result);
        
    }
    
    
    func calculateTotalAchieved(drives: [Drive]) -> String {
        var totalColor = "gray"
        if calculateTotalHours(drives: drives) == 120 {
            totalColor = "yellow"
        }
        return totalColor;
    }


}
struct AcheivementsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AcheivementsScreen()
    }
}

