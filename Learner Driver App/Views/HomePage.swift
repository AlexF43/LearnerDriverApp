//
//  HomePage.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 21/1/22.
//

import SwiftUI

struct HomePage: View {
    @State var progressValue: Float = 0.0
    
    var body: some View {
        VStack {
            
            DrivesList()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
