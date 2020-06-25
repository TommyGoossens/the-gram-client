//
//  GramPostProfile.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
class GramPostProfile: Decodable, Encodable {
    let userId: String
    var userName:String
    var profilePictureURL:String
    
    init(userId: String, userName:String, profilePictureURL:String) {
        self.userId = userId
        self.userName = userName
        self.profilePictureURL = profilePictureURL
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case userName = "userName"
        case profilePictureURL = "profilePictureURL"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(userName, forKey: .userName)
        try container.encode(profilePictureURL, forKey: .profilePictureURL)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decode(String.self, forKey: .userId)
        userName = try container.decode(String.self, forKey: .userName)
        profilePictureURL = try container.decode(String.self, forKey: .profilePictureURL)
    }
}
