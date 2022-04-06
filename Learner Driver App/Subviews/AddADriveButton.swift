//
//  AddADriveButton.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/1/22.
//

import SwiftUI

struct AddADriveButton: View {
    var body: some View {
        ZStack {
            
            Circle().stroke(Color.black, lineWidth: 0.5)
                .frame(width:50)
            Circle().fill(Color.gray)
                .opacity(0.3)
                .frame(width:50)
            
            
                
           // Circle()
             //   .foregroundColor(Color.gray)
             //   .opacity(0.3)
             //   .frame(width: 50)
               
            
            Text("+")
                .font(.title)
                .foregroundColor(Color.black)
        }
    }
}

struct AddADriveButton_Previews: PreviewProvider {
    static var previews: some View {
        AddADriveButton()
    }
}
