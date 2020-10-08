//
//  PostRequest.swift
//  Tweets
//
//  Created by Axity on 08/10/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import Foundation
struct PostResponse: Codable {
    let id: String
    let author: User
    let imageUrl: String
    let text: String
    let videoUrl: String
    let location: PostLocation
    let hasVideo: Bool
    let hasImage: Bool
    let hasLocation: Bool
    let createdAt: String
    
}
