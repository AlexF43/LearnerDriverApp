//
//  SupervisorsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import SwiftUI

struct SupervisorsView: View {
    @EnvironmentObject var supervisorsContainer: SupervisorsContainer

    var body: some View {
        List {
            Section {
                ForEach(supervisorsContainer.supervisors, id: \.self) { supervisor in
                    SupervisorRow(supervisor: supervisor)
                }
                .onDelete(perform: delete)
            }
            Section(footer:
                        HStack(alignment: .center) {
                Spacer()

                NavigationLink {
                        SupervisorAdd()
                } label: {
                        HStack {
                            Image(systemName: "plus")
                                .font(.body)
                            Text("Add")
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                    }
                Spacer()

            }) {
                EmptyView()
            }
        }
        
        .navigationTitle("Supervisors")
        .toolbar {
            EditButton()
                
    }
    
}
    
    
//

        
    
    
    
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
