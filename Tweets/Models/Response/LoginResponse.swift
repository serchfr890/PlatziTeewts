//
//  LoginResponse.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import Foundation
struct LoginResponse: Codable {
    let user: User
    let token: String
}
