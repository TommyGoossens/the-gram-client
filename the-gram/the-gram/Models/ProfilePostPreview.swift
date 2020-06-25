//
//  ProfilePostPreview.swift
//  The Gram
//
//  Created by Tommy Goossens on 10/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
struct ProfilePostPreview : Decodable {
    var id: Int
    var mediaURL: String
    
    enum CodingKeys: String, CodingKey {
         case id = "id"
         case mediaURL = "mediaURL"
     }
}
