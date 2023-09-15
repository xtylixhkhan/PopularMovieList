//
//  NetworkManager.swift
//  Task
//
//  Created by Muhammad Junaid on 14/09/2023.
//

import Foundation
import Alamofire

class NetworkManager {
    static var shared = NetworkManager()
    
    func getPopularMovies(completion: @escaping (MovieResponse?, String?) -> Void) -> Void {
        AF.request(NetworkRouter.popularMovies).responseDecodable(decoder: JSONDecoder(), completionHandler: {
            (response: DataResponse<MovieResponse, AFError>) in
            debugPrint(response)
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        })
    }
}
