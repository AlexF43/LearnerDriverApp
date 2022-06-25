//
//  Submission.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 22/6/22.
//

import SwiftUI
import Foundation

struct Submission: View {
    @EnvironmentObject var personalContainer: PersonalContainer
    @EnvironmentObject var drivesContainer: DrivesContainer
    let currentDate = Date()
//    let delta = currentDate.timeIntervalSince(personalContainer.personal.DOBDate)
    
    var body: some View {
        Form {
            Section(header: Text("Requirements")) {
                
                HStack {
                    Text("Over 17 years of age:")
                    Spacer()
                    Text("\(oldEnough())")
                }
                
                HStack {
                    Text("Total hours:")
                    Spacer()
                    Text("\(calculateTotalHours(drives: drivesContainer.drives)) / 120")
                }
                
                HStack {
                    Text("Night hours:")
                    Spacer()
                    Text("\(calculateNightHours(drives: drivesContainer.drives)) / 20")
                }
                
                HStack {
                    Text("Hazards:")
                    Spacer()
                    if personalContainer.personal.hpt == true {
                        Text("Completed")
                            .multilineTextAlignment(.trailing)
                    } else {
                        Text("Not Completed")
                    }
                }
                
            }
            
            
            Section(header: Text("Optionals")) {
                HStack {
                    Text("Safer Drivers:")
                    Spacer()
                    if personalContainer.personal.sdc == true {
                        Text("Completed")
                            .multilineTextAlignment(.trailing)
                    } else {
                        Text("Not Completed")
                    }
                }
            }
            
            Section(footer:
                        HStack(alignment: .center) {
                Spacer()
                
                if personalContainer.personal.hpt == true && calculateTotalHours(drives: drivesContainer.drives) == 120 && calculateNightHours(drives: drivesContainer.drives) == 20 && oldEnough() == "Over 17" {
                    Text("Completed")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(30)
                } else {
                    Text("Not yet completed")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(30)
                }
                
                Spacer()
                
            }) {
                EmptyView()
            }
        }
        .navigationTitle("Submission")
    }
    
    public func calculateTotalHours(drives: [Drive]) -> Int {
        var hoursDriven = 0.0
        for drive in drives {
            hoursDriven += Double(drive.endOdometer) - Double(drive.startOdometer)
        }
        
        var result = Int(hoursDriven)
        
        if personalContainer.personal.sdc == true {
            result = result + 20
        }
        
        if result >= 120 {
            result = 120
        }
        
        if result <= 0 {
            result = 0
        }
        
        
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
        
        if result >= 20 {
            result = 20
        }
        
        if result <= 0 {
            result = 0
        }
        
        return result;
    }
    
    func oldEnough() -> String {
        let currentDate = Date()
        let monthsSince = Calendar.current.dateComponents([.month], from: personalContainer.personal.DOBDate, to: currentDate)
        let intMonthsSince = monthsSince.month ?? 0
        print(intMonthsSince)
        
        var result: String
        if intMonthsSince >= 204 {
            result = "Over 17"
        } else {
            let monthsLeft = 204 - intMonthsSince
            result = "\(monthsLeft) months to go!"
        }
        return result;
    }
}

struct Submission_Previews: PreviewProvider {
    static var previews: some View {
        Submission()
    }
}
