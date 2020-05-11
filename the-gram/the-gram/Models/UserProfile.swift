//
//  UserProfile.swift
//  The Gram
//
//  Created by Tommy Goossens on 22/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
struct UserProfile: Decodable {

    
    var userId:String
    var email:String
    var firstName:String
    var lastName:String
    var userName:String
    var profilePictureURL:String
    var followers:[String]
    var following:[String]
    var posts:[ProfilePostPreview]
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case userName = "userName"
        case profilePictureURL = "profilePictureURL"
        case followers = "followers"
        case following = "following"
        case posts = "posts"
    }
}
