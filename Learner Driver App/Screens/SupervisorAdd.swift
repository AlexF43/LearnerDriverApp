//
//  SupervisorAdd.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 20/6/22.
//

import SwiftUI

struct SupervisorAdd: View {
    @EnvironmentObject var supervisorsContainer: SupervisorsContainer
    @Environment(\.dismiss) var dismiss
    @State var showAlert = false
    
    var body: some View {
        
        Form{
            Section {
                HStack (spacing: 0) {
                    Text("Instructor")
                    TextField("Instructor", text: $supervisorsContainer.currentSupervisor.firstName)
                        .multilineTextAlignment(.trailing)
                }
                
            }
            
            Section(footer:HStack(alignment: .center) {
                Spacer()
                
                Button( action: {
                    if supervisorsContainer.currentSupervisor.firstName != "" {
                        supervisorsContainer.addSupervisor(supervisor: supervisorsContainer.currentSupervisor)
                        dismiss()
                    } else {
                        showAlert = true
                    }
                }) {
                    HStack {
                        Text("Save")
                            .fontWeight(.semibold)
                            .font(.title3)
                        //                            Image(systemName: "square.and.arrow.down")
                        //                                .font(.body)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Unable to save supervisor"),
                            message: Text("Please enter the supervisors name into the field")
                        )}
                    
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
