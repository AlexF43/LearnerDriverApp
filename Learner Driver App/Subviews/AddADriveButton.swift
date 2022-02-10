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
            Circle()
                .foregroundColor(Color.gray)
                .opacity(0.3)
                .frame(width: 50)
            
            Text("+")
                .font(.title)
        }
    }
}

struct AddADriveButton_Previews: PreviewProvider {
    static var previews: some View {
        AddADriveButton()
    }
}
