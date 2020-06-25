//
//  Post.swift
//  The Gram
//
//  Created by Tommy Goossens on 22/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation

class Post: ObvservableListItem, Decodable, Encodable {
    
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.postId == rhs.postId
    }
    
    var id = UUID()
    
    var postId:Int
    var user: GramPostProfile
    var mediaURL: String
    var datePosted: Date
    var description: String
    var likes:Int
    var comments: Int
    var postLikedByAuthUser: Bool
    
    internal init(postId: Int, user: GramPostProfile, mediaURL: String, datePosted: Date, description: String, likes: Int, comments: Int, postLikedByAuthUser: Bool) {
        self.postId = postId
        self.user = user
        self.mediaURL = mediaURL
        self.datePosted = datePosted
        self.description = description
        self.likes = likes
        self.comments = comments
        self.postLikedByAuthUser = postLikedByAuthUser
    }
    
    enum CodingKeys: String,CodingKey {
        case postId = "postId"
        case user = "user"
        case mediaURL = "mediaURL"
        case datePosted = "datePosted"
        case description = "description"
        case likes = "likes"
        case comments = "comments"
        case postLikedByAuthUser = "postLikedByAuthUser"
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(postId, forKey: .postId)
        try container.encode(user, forKey: .user)

        try container.encode(mediaURL, forKey: .mediaURL)
        try container.encode(datePosted, forKey: .datePosted)

        try container.encode(description, forKey: .description)
        try container.encode(likes, forKey: .likes)
        try container.encode(comments, forKey: .comments)
        try container.encode(postLikedByAuthUser, forKey: .postLikedByAuthUser)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        postId = try container.decode(Int.self, forKey: .postId)
        user = try container.decode(GramPostProfile.self, forKey: .user)

        mediaURL = try container.decode(String.self, forKey: .mediaURL)
        datePosted = try container.decode(Date.self, forKey: .datePosted)

        description = try container.decode(String.self, forKey: .description)
        likes = try container.decode(Int.self, forKey: .likes)
        comments = try container.decode(Int.self, forKey: .comments)
        postLikedByAuthUser = try container.decode(Bool.self, forKey: .postLikedByAuthUser)
        
    }
}


