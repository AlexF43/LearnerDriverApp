//
//  DriveData.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 9/1/22.
//

import Foundation

class DrivesContainer : ObservableObject {
    @Published var drives: [Drive]
    @Published var currentDrive: Drive
    
    let fileName = "sampleDrives.json"

    
    init() {
        drives = [Drive]()
        currentDrive = Drive()
        drives = load(fileName)
    }
    
    func load(_ filename: String) -> [Drive] {
        let data: Data
        
        let file = getDocumentsDirectory().appendingPathComponent(fileName)
//        let file = file(.prettyPrinted)
        print(file)

        do {
            data = try Data(contentsOf: file)
        } catch {
            // file does not exist. Return a new empty list
            return [Drive]()
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Drive].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([Drive].self):\n\(error)")
        }
    }

    func addDrive(drive: Drive) {
        drives.append(drive)
        saveDrives()
        drives = load(fileName)
    }
    
    func saveCurrentDrive() {
        print("drives[0] \(drives[0].vehicle)")
        print("currentDrive \(currentDrive.vehicle)")
        if let foundDrive = drives.first(where: { $0.id == currentDrive.id }) {
            if let index = drives.firstIndex(of: foundDrive) {
                drives[index] = currentDrive
            }
        }
        print("drives[0] \(drives[0].vehicle)")
        saveDrives()
    }
    
    func deleteCurrentDrive() {
        if let foundDrive = drives.first(where: { $0.id == currentDrive.id }) {
            if let index = drives.firstIndex(of: foundDrive) {
                drives.remove(at: index)
            }
        }
        saveDrives()
    }

    func saveDrives() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(drives)

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

func DeleteDrive() {
    print("wowzers, i was deleted")
}
