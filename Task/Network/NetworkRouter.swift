//
//  NetworkRouter.swift
//  Task
//
//  Created by Muhammad Junaid on 14/09/2023.
//

import Foundation
import Alamofire

enum NetworkRouter: URLRequestConvertible {
    
    case popularMovies
    
    //MARK: Endpoints
    
    var path: String {
        switch self {
        case .popularMovies: return "movie/popular"
        }
    }
    
    // MARK: - HTTPMethod
    
    var method: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }
    
    // MARK: - Parameters
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    // MARK: - Headers
    
    var headers: HTTPHeaders {
        var headers: [HTTPHeader] = []
        switch self {
        case .popularMovies:
            headers.append(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
            headers.append(HTTPHeader(name: "accept", value: "application/json"))
        }
        return HTTPHeaders(headers)
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        if method == .get {
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        else if method == .post || method == .patch {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        return request
    }
}
