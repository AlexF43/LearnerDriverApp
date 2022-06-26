//
//  VehicleData.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 23/6/22.
//

import Foundation
import UIKit

class VehiclesContainer : ObservableObject {
    @Published var vehicles: [Vehicle]
    @Published var currentvehicle: Vehicle
    
    let fileName = "samplevehicles.json"
    
    init() {
        vehicles = [Vehicle]()
        currentvehicle = Vehicle()
        vehicles = load(fileName)
    }
    
    func load(_ filename: String) -> [Vehicle] {
        let data: Data
        
        let file = getDocumentsDirectory().appendingPathComponent(fileName)
        //        let file = file(.prettyPrinted)
        print(file)
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            // file does not exist. Return a new empty list
            return [Vehicle]()
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Vehicle].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([Vehicle].self):\n\(error)")
        }
    }
    
    func getVehicle(byId id: String) -> Vehicle? {
        return vehicles.first(where: { $0.id == id })
    }
    
    func addvehicle(vehicle: Vehicle) {
        vehicles.append(vehicle)
        savevehicle()
        vehicles = load(fileName)
    }
    
    func saveCurrentvehicle() {
        //        print("vehicles[0] \(vehicles[0].vehicle)")
        //        print("currentDrive \(currentvehicle.vehicle)")
        if let foundvehicle = vehicles.first(where: { $0.id == currentvehicle.id }) {
            if let index = vehicles.firstIndex(of: foundvehicle) {
                vehicles[index] = currentvehicle
            }
        }
        //        print("vehicles[0] \(vehicles[0].vehicle)")
        savevehicle()
    }
    
    func deletevehicle(atPosition position: Int ) {
        let foundvehicle = vehicles[position]
        if let index = vehicles.firstIndex(of: foundvehicle) {
            vehicles.remove(at: index)
        }
        savevehicle()
    }
    
    func deleteCurrentvehicle() {
        if let foundvehicle = vehicles.first(where: { $0.id == currentvehicle.id }) {
            if let index = vehicles.firstIndex(of: foundvehicle) {
                vehicles.remove(at: index)
            }
        }
        savevehicle()
    }
    
    func savevehicle() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(vehicles)
            
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
