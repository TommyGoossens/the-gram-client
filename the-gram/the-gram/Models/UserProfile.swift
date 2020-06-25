//
//  UserProfile.swift
//  The Gram
//
//  Created by Tommy Goossens on 22/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
class UserProfile: ObvservableListItem {
    init(userId: String, email: String, firstName: String, lastName: String, userName: String, profilePictureURL: String, followers: Int, following: Int, posts: [Post]) {
        self.userId = userId
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.profilePictureURL = profilePictureURL
        self.followers = followers
        self.following = following
        self.posts = posts
    }
    
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        lhs.userId == rhs.userId
    }
//
//    @Published var profile:UserProfile? = nil
//    @Published var fetched:Bool = false
//    private let restService = RestService()
//    private var endpoint:String?
//
//    init(endpoint:String) {
//        self.endpoint = endpoint
//    }
//
//    func fetchUserProfile(){
//      self.restService.getRequest(endpoint: "\(self.endpoint!)", of: UserProfile.self) { response in
//            DispatchQueue.main.async {
//                self.profile = response
//                print(self.profile?.userName!)
//                self.fetched = true
//            }
//        }
//    }
//
//    init(){}
    
    var userId:String
    var email:String
    var firstName:String
    var lastName:String
    var userName:String
    var profilePictureURL:String
    var followers:Int
    var following:Int
    var posts:[Post]
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case userName = "userName"
        case profilePictureURL = "profilePictureURL"
        case followers = "numberOfFollowers"
        case following = "numberOfFollowing"
        case posts = "posts"
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(userId, forKey: .userId)
//        try container.encode(email, forKey: .email)
//
//        try container.encode(firstName, forKey: .firstName)
//        try container.encode(lastName, forKey: .lastName)
//
//        try container.encode(userName, forKey: .userName)
//        try container.encode(profilePictureURL, forKey: .profilePictureURL)
//        try container.encode(followers, forKey: .followers)
//        try container.encode(following, forKey: .following)
//        try container.encode(posts, forKey: .posts)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        userId = try container.decode(String.self, forKey: .userId)
//        email = try container.decode(String.self, forKey: .email)
//
//        firstName = try container.decode(String.self, forKey: .firstName)
//        lastName = try container.decode(String.self, forKey: .lastName)
//
//        userName = try container.decode(String.self, forKey: .userName)
//        profilePictureURL = try container.decode(String.self, forKey: .profilePictureURL)
//        followers = try container.decode(Int.self, forKey: .followers)
//        following = try container.decode(Int.self, forKey: .following)
//        posts = try container.decode([Post].self, forKey: .posts)
//    }
}
