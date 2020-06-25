//
//  UserSearchResult.swift
//  The Gram
//
//  Created by Tommy Goossens on 17/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
struct UserSearchResult: ObvservableListItem, Decodable{
    var id = UUID()
    
    var userId:String
    var userName:String
    var profilePictureURL:String

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case userName = "userName"
        case profilePictureURL = "profilePictureURL"
    }
}
