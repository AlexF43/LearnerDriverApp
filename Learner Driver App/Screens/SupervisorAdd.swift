//
//  SupervisorAdd.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 20/6/22.
//

import SwiftUI

struct SupervisorAdd: View {
    @EnvironmentObject var supervisorsContainer: SupervisorsContainer
    
    var body: some View {
        
        Form{
            Section {
                HStack (spacing: 0) {
                    Text("Instructor")
                    TextField("Instructor", text: $supervisorsContainer.currentSupervisor.firstName)
                        .multilineTextAlignment(.trailing)
                }
                
            }
            
            Section(footer:
                        HStack(alignment: .center) {
                Spacer()

                Button( action: {
                    supervisorsContainer.addSupervisor(supervisor: supervisorsContainer.currentSupervisor)
                }) {
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
        } .task {
            supervisorsContainer.currentSupervisor = Supervisor()
        }
    }
}

struct SupervisorAdd_Previews: PreviewProvider {
    static var previews: some View {
        SupervisorAdd()
    }
}
