//
//  User.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
class User {
    
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
