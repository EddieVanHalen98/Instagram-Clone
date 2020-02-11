//
//  User.swift
//  instagram
//
//  Created by James Saeed on 10/02/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let email: String
    let password: String
    let username: String
    let avatarPath: String
}

struct LoginCredentials: Encodable {
    
    let email: String
    let password: String
}
