//
//  Endpoints.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import Foundation

struct Endpoints {
    static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    static let login = Endpoints.domain + "/auth"
    static let register = Endpoints.domain + "/register"
    static let post = Endpoints.domain + "/posts"
}
