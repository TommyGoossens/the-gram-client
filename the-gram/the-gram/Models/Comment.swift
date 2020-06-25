//
//  Comment.swift
//  The Gram
//
//  Created by Tommy Goossens on 23/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation

struct Comment : Decodable, ObvservableListItem {
    let id = UUID()
    let userId: String
    let userName:String
    let dateOfComment:Date
    let message:String
    
    enum CodingKeys: String, CodingKey{
        case userId = "userId"
        case userName = "userName"
        case dateOfComment = "dateOfComment"
        case message = "message"
    }
}
