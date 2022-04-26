//
//  PersonalData.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 25/4/22.
//

import Foundation

class PersonalContainer : ObservableObject {
    @Published var personals: [Personal]

    let filePersonal = "PersonalData.json"


    init() {
        personals = [Personal]()
        personals = load(filePersonal)
    }

    func load(_ filePersonal: String) -> [Personal] {
        let data2: Data

        let file2 = getDocumentsDirectory().appendingPathComponent(filePersonal)
//        let file = file(.prettyPrinted)
        print(file2)

        do {
            data2 = try Data(contentsOf: file2)
        } catch {
            // file does not exist. Return a new empty list
            return [Personal]()
        }

        do {
            let decoder2 = JSONDecoder()
            return try decoder2.decode([Personal].self, from: data2)
        } catch {
            fatalError("Couldn't parse \(filePersonal) as \([Personal].self):\n\(error)")
        }
    }

    func addPersonal(personal: Personal) {
        personals.append(personal)
        savePersonal()
        personals = load(filePersonal)
    }

    func savePersonal() {
        let encoder2 = JSONEncoder()
        encoder2.outputFormatting = .prettyPrinted

        do {
            let jsonData2 = try encoder2.encode(personals)

            if let jsonString2 = String(data: jsonData2, encoding: .utf8) {
                print(jsonString2)

                let file2 = getDocumentsDirectory().appendingPathComponent(filePersonal)
                do {
                    try jsonString2.write(to: file2, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    fatalError("Couldn't save json string to \(file2)")
                    // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths2[0]
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
