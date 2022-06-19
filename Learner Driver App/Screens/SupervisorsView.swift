//
//  SupervisorsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import SwiftUI

struct SupervisorsView: View {
    @EnvironmentObject var supervisorsContainer: SupervisorsContainer
//    var supervisor: Supervisor

    var body: some View {
        List {
            ForEach(supervisorsContainer.supervisors, id: \.self) { supervisor in
                SupervisorRow(supervisor: supervisor)
            }
            .onDelete(perform: delete)
        }
            
        .navigationTitle("Supervisors")
        .toolbar {
            EditButton()
                
            Section {
                Text("hello")
            }
        }
    }
    
    
    
//
//    Button(action: {
//        print("Delete tapped!")
//    }) {
//        HStack {
//            Image(systemName: "trash")
//                .font(.title)
//            Text("Delete")
//                .fontWeight(.semibold)
//                .font(.title)
//        }
//        .padding()
//        .foregroundColor(.white)
//        .background(Color.red)
//        .cornerRadius(40)
        
    func delete(at offsets: IndexSet) {
        if let min = offsets.min() {
            supervisorsContainer.deleteSupervisor(atPosition: min)
        }
    }
}

//struct SupervisorsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SupervisorsView()
//    }
//}
