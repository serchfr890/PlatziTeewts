//
//  PostRequest.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import Foundation
struct PostRequest: Codable {
    let email: String
    let names: String
    let password: String
}
