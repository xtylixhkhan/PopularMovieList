//
//  NetworkConnectivity.swift
//  Task
//
//  Created by Muhammad Junaid on 15/09/2023.
//

import Foundation
import Alamofire

struct NetworkConnectivity {
    static let network = NetworkReachabilityManager()
    
    static var isConnectedToInternet: Bool {
        return network?.isReachable ?? true
    }
}
