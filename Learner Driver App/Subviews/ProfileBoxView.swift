//
//  ProfileBoxView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 18/4/22.
//

import SwiftUI

struct ProfileBoxView: View {
    var name: String {
        "Alex Fogg"
        
    }
    var body: some View {
        
        VStack{
            ZStack{
                Rectangle()
                    .frame( width:350, height: 120)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))

                HStack{
                    ZStack{
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(width: 100)
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width:100)
                        
                            .foregroundColor(Color.gray.opacity(0.1))
                        Text("Test")
                            .foregroundColor(Color.black)
                            
                    }
                    VStack (alignment: .leading){
                        Text(name)
                            .foregroundColor(Color.black)
                            .font(.system(size: 30).bold())
                        Text("View and edit your profile")
                            .foregroundColor(Color.black)
                        
                    }
                    
                    
                }
            }
        }
    
    }
}

struct ProfileBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBoxView()
    }
}
