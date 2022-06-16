//
//  SupervisorData.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 13/5/22.
//

import Foundation
import UIKit

class SupervisorsContainer : ObservableObject {
    @Published var supervisors: [Supervisor]
    @Published var currentSupervisor: Supervisor
    
    let fileName = "sampleSupervisors.json"
    
    init() {
        supervisors = [Supervisor]()
        currentSupervisor = Supervisor()
        supervisors = load(fileName)
    }
    
    func load(_ filename: String) -> [Supervisor] {
        let data: Data
        
        let file = getDocumentsDirectory().appendingPathComponent(fileName)
//        let file = file(.prettyPrinted)
        print(file)

        do {
            data = try Data(contentsOf: file)
        } catch {
            // file does not exist. Return a new empty list
            return [Supervisor]()
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Supervisor].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([Supervisor].self):\n\(error)")
        }
    }

    func addSupervisor(supervisor: Supervisor) {
        supervisors.append(supervisor)
        saveSupervisor()
        supervisors = load(fileName)
    }
    
    func saveCurrentSupervisor() {
//        print("supervisors[0] \(supervisors[0].vehicle)")
//        print("currentDrive \(currentSupervisor.vehicle)")
        if let foundSupervisor = supervisors.first(where: { $0.id == currentSupervisor.id }) {
            if let index = supervisors.firstIndex(of: foundSupervisor) {
                supervisors[index] = currentSupervisor
            }
        }
//        print("supervisors[0] \(supervisors[0].vehicle)")
        saveSupervisor()
    }
    
    func deleteSupervisor(atPosition position: Int ) {
        let foundSupervisor = supervisors[position]
        if let index = supervisors.firstIndex(of: foundSupervisor) {
            supervisors.remove(at: index)
        }
        saveSupervisor()
    }
    
    func deleteCurrentSupervisor() {
        if let foundSupervisor = supervisors.first(where: { $0.id == currentSupervisor.id }) {
            if let index = supervisors.firstIndex(of: foundSupervisor) {
                supervisors.remove(at: index)
            }
        }
        saveSupervisor()
    }

    func saveSupervisor() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(supervisors)

            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                let file = getDocumentsDirectory().appendingPathComponent(fileName)
                do {
                    try jsonString.write(to: file, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    fatalError("Couldn't save json string to \(file)")
                    // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
//    func resetDrives() {
//        let defultData: String = load("sampleDrives.json")
//        let file = getDocumentsDirectory().appendingPathComponent(fileName)
//        do {
//            try defultData.write(to: file, atomically: true, encoding: String.Encoding.utf8)
//        } catch {
//            fatalError("Couldn't save revert to test data")
//        }
//    }
    
}
