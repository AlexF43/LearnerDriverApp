//
//  PersonalData.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 25/4/22.
//

import Foundation

class PersonalContainer : ObservableObject {
    @Published var personal: Personal

    let filePersonal = "PersonalData.json"


    init() {
        personal = Personal()
        personal = load(filePersonal)
        personal.sdc = false
    }

    func load(_ filePersonal: String) -> Personal {
        let data: Data

        let file = getDocumentsDirectory().appendingPathComponent(filePersonal)
//        let file = file(.prettyPrinted)
        print(file)

        do {
            data = try Data(contentsOf: file)
        } catch {
            // file does not exist. Return a new empty list
            return Personal()
        }
        print(data)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Personal.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filePersonal) as \(Personal.self):\n\(error)")
        }
    }

    func editPersonal(personal: Personal) {
//        personal.append(personal)
        savePersonal()
//        personal = load(filePersonal)
    }

    func savePersonal() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(personal)

            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)

                let file = getDocumentsDirectory().appendingPathComponent(filePersonal)
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

//    func resetDrives() {
//        let defultData: String = load("sampleDrives.json")
//        let file = getDocumentsDirectory().appendingPathComponent(fileName)
//        do {
//            try defultData.write(to: file, atomically: true, encoding: String.Encoding.utf8)
//        } catch {
//            fatalError("Couldn't save revert to test data")
//        }
    
    

//
//func DeleteDrive() {
//    print("wowzers, i was deleted")
//}
