//
//  GramPostProfile.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
struct GramPostProfile: Decodable {
    
    var userName:String
    var profilePictureURL:String
    
    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case profilePictureURL = "profilePictureURL"
    }
}
