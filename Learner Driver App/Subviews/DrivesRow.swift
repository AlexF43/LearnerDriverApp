//
//  DrivesRow.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 8/1/22.
//

import SwiftUI

struct DrivesRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var vehiclesContainer: VehiclesContainer
    
    var drive: Drive
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame( height: 80)
                .foregroundColor(Color.gray.opacity(0.2))
                .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray.opacity(0.5), lineWidth: 3))
            HStack {
                if (drive.isDayTime == true) {
                    Image("Daytime")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                }
                else {
                    Image("Nighttime")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                }
                
                VStack {
                    Text( vehiclesContainer.getVehicle(byId: drive.vehicle)?.vehicleName ?? "Unknown vehicle")
                        .font(.title2)
                    
                    Text("Drive on " + drive.formattedStartDate)
//                    print(drive.vehicle)
                }
                .padding(.vertical, 25)
                
                Spacer()
                
//                Delete_button()
//                    .padding()
                
                
//                VStack {
//                    Text(drive.startLocation)
//
//                    Text("\(drive.distance) km")
//                }
//                .padding()
                

            }
            .foregroundColor(Color.black)
        }
        .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
                    .onEnded { value in
                        let horizontalAmount = value.translation.width as CGFloat
                        let verticalAmount = value.translation.height as CGFloat
                        
                        if abs(horizontalAmount) > abs(verticalAmount) {
                            print(horizontalAmount < 10 ? "left swipe" : "right swipe")
                        } else {
                            print(verticalAmount < 10 ? "up swipe" : "down swipe")
                        }
                    })
    }
}

struct DrivesRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrivesRow(drive:  DrivesContainer().drives[0])
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}

