//
//  AchievementCirclesView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/4/22.
//

import SwiftUI

struct AchievementCirclesView: View {
    var body: some View {
        VStack{
            
            Rectangle()
                .stroke(Color.black, lineWidth: 0.5)
                .frame(width:380, height:1)
            Text("Your Goals")
                .font(.system(size: 25))
            
            
            HStack{
                VStack{
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                            .frame(width:100, height:100)
                        Image(systemName: "star.fill")
                            .resizable()
                            .opacity(0.6)
                            .frame(width:70, height:70)
                    }
                    Text("Complete all 120 hours")
                        .font(.system(size: 12))
                        .frame(width:80)
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                
                VStack{
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                            .frame(width:100, height:100)
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .opacity(0.6)
                            .frame(width:80, height:80)
                    }
                    Text("Complete all 100 day hours")
                        .font(.system(size: 12))
                        .frame(width:80)
                        .multilineTextAlignment(.center)
                }
          
                
                VStack{
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                            .frame(width:100, height:100)
                        Image(systemName: "moon.fill")
                        
                            .resizable()
                            .opacity(0.6)
                            .frame(width:70, height:70)
                            .rotationEffect(.degrees(45))
                    }
                    Text("Complete 20 night hours")
                        .font(.system(size: 12))
                        .frame(width:80)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .padding()
            
            HStack{
                
                VStack{
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                            .frame(width:100, height:100)
                        Text("S")
                            .opacity(0.6)
                            .frame(width:80, height:80)
                            .font(.system(size: 60))
                    }
                    Text("Complete the SDC")
                        .font(.system(size: 12))
                        .frame(width:80)
                        .multilineTextAlignment(.center)
                }
                .padding()
                VStack{
                    
                    
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                            .frame(width:100, height:100)
                        Text("H")
                            .font(.system(size: 60))
                        
                        
                            .opacity(0.6)
                            .frame(width:70, height:70)
                        
                    }
                    Text("Complete the HPT")
                        .font(.system(size: 12))
                        .frame(width:80)
                        .multilineTextAlignment(.center)
                }
                
             //   .padding()
                
                VStack{
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                            .frame(width:100, height:100)
                        Text("2000")
                            .opacity(0.6)
                            .font(.system(size:30))
                            .frame(width:75, height:75)
                        
                    }
                    Text("Drive for 2000km")
                        .font(.system(size: 12))
                        .frame(width:80)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                
            }
            
            
        }
    }
}

struct AchievementCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementCirclesView()
    }
}
