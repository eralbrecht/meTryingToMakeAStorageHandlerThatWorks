//
//  StorageHandler.swift
//  ClassConstraints
//
//  Created by Christopher Boyd on 10/14/20.
//

import Foundation

struct StorageHandler {
    static var defaultStorage: UserDefaults = UserDefaults.standard
    static let defaultKey = "TaskCollection"
    
    static func getStorage() {
        if isSet(key: self.defaultKey) {
            let encodedString = UserDefaults.standard.dictionaryRepresentation()[self.defaultKey] as! String
            
            TaskManager.taskCollection = decodeCollection(encodedString.data(using: .utf8)!)
        }
    }
    
    static func isSet(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    static func set(value: Task) {
        TaskManager.taskCollection.append(value)
        
        defaultStorage.set(encodeCollection(), forKey: self.defaultKey)
    }

    static func set() {
        defaultStorage.set(encodeCollection(), forKey: self.defaultKey)
    }
    static func encodeCollection() -> String {
        // Our JSON Encoder
        let encoder = JSONEncoder()
        
        /**
         * We attempt to encode the Task array that is part of TaskManager
         * If this fails in any way, we simply return an empty string to be stored
         * Otherwise, we then convert that encoded JSON data to a string and return that
         */
        guard let encoded = try? encoder.encode(TaskManager.taskCollection)
        else{
            return ""
        }
        print(storageCount())
        //If encoded succeeded, we convert the JSON to a simple string and return that
        guard let stringEncoded = String(data: encoded, encoding: .utf8)
        else {
            return ""
        }
        return stringEncoded
    }
    
    static func decodeCollection(_ encodedString: Data) -> [Task] {
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([Task].self, from: encodedString)
        else {
            let newTaskCollection: [Task] = []
            return newTaskCollection
        }
        
        return decoded
    }

    static func storageCount() -> Int {
        return TaskManager.taskCollection.count
    }
}

