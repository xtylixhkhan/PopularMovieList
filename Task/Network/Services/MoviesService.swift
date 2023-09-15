//
//  MoviesService.swift
//  Task
//
//  Created by Muhammad Junaid on 15/09/2023.
//

import Foundation

class MoviesService {
    
    func getPopularMovies(completion: @escaping (([Movie]?, String?) -> Void)) {
        guard NetworkConnectivity.isConnectedToInternet else {
            let movies = LocalStorage.getMoviesData()
            completion(movies, nil)
            return
        }
        
        NetworkManager.shared.getPopularMovies(completion: {
            result, message in
            if let result {
                let movies = result.movieList
                LocalStorage.saveMoviesData(movies: movies)
                completion(movies, nil)
            }
            else if let message {
                completion(nil, message)
            }
        })
    }
}
