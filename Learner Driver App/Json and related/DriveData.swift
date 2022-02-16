//
//  DriveData.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 9/1/22.
//

import Foundation


class DrivesContainer : ObservableObject {
    @Published var drives: [Drive]
    
    let fileName = "sampleDrives.json"

    
    init() {
        drives = [Drive]()
        drives = load(fileName)
    }
    
    func load(_ filename: String) -> [Drive] {
        let data: Data
        
        let file = getDocumentsDirectory().appendingPathComponent(fileName)

        do {
            data = try Data(contentsOf: file)
        } catch {
            // file does not exist. Return a new empty list
            return [Drive]()
        }

        do {
            let decoder = JSONDecoder()
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
}


