//
//  CircularProfilePicture.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct CircularProfilePicture: View {
    let height:CGFloat
    var body: some View {
        Image("appicon")
            .resizable()
            .frame(width: height, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircularProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfilePicture(height: 15.0)
    }
}
