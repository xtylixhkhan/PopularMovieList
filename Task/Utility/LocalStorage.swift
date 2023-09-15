//
//  LocalStorage.swift
//  Task
//
//  Created by Muhammad Junaid on 15/09/2023.
//

import Foundation

struct LocalStorage {
    
    static func saveMoviesData(movies: [Movie]?) {
        do {
            let data = try JSONEncoder().encode(movies)
            UserDefaults.standard.set(data, forKey: "MOVIES")
            UserDefaults.standard.synchronize()
        }
        catch {
            debugPrint(error)
        }
    }
    
    static func getMoviesData() -> [Movie]? {
        if let data = UserDefaults.standard.value(forKey: "MOVIES") as? Data {
            do {
                return try JSONDecoder().decode([Movie].self, from: data)
            }
            catch {
                debugPrint(error)
            }
        }
        return nil
    }
}
