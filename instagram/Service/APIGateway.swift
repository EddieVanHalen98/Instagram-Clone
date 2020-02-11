//
//  APIGateway.swift
//  instagram
//
//  Created by James Saeed on 10/02/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import Foundation

class APIGateway {
    
    static let shared = APIGateway()
    
    var loggedIn: Bool {
        return UserDefaults.standard.value(forKey: "username") != nil
    }
    
    private func request(_ type: RequestType, endpoint: String, body: Data?, completion: @escaping (APIResponse, Data?) -> ()) {
        guard let url = URL(string: "http://192.168.86.24:3000\(endpoint)") else {
            completion(.invalidURL, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        
        if type == .post || type == .patch {
            request.httpBody = body
            
            var headers = request.allHTTPHeaderFields ?? [:]
            headers["Content-Type"] = "application/json"
            request.allHTTPHeaderFields = headers
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                completion(response.apiResponse, data)
            } else {
                completion(.invalidResponse, data)
            }
        }.resume()
    }
    
    func register(with email: String, _ password: String, _ username: String, completion: @escaping (APIResponse) -> ()) {
        let user = User(email: email, password: password, username: username, avatarPath: "")
        guard let data = try? JSONEncoder().encode(user) else {
            completion(.invalidData)
            return
        }
        
        request(.post, endpoint: "/users/register", body: data) { response, _ in
            completion(response)
        }
    }
    
    func login(with email: String, _ password: String, completion: @escaping (User?, APIResponse) -> ()) {
        let loginCredentials = LoginCredentials(email: email, password: password)
        guard let data = try? JSONEncoder().encode(loginCredentials) else {
            completion(nil, .invalidData)
            return
        }
        
        request(.post, endpoint: "/users/login", body: data) { response, data in
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                completion(nil, .invalidData)
                return
            }
            
            completion(user, response)
        }
    }
}

enum RequestType: String {
    
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
