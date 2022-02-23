//
//  Delete button.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 21/2/22.
//

import SwiftUI

struct Delete_button: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.gray)
                .opacity(0.3)
                .frame(width: 30)
            
            Text("-")
                .font(.title)
        }
    }
}
struct Delete_button_Previews: PreviewProvider {
    static var previews: some View {
        Delete_button()
    }
}
