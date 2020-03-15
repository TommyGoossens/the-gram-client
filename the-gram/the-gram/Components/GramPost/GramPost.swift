//
//  GramPost.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPost: View {
    var body: some View {
        VStack(spacing: 0.0) {
            GramPostHeader()
            Image("turtlerock").resizable()
                .frame(width:375.0,height:375)
                .padding(.top, 5.0)
            GramPostButtons()
                .padding(.top, 5.0)
            GramPostLikes()
            .padding(.top, 5.0)
            GramPostCommentsPreview()
            .padding(.top, 5.0)
        }
    }
}

struct GramPost_Previews: PreviewProvider {
    static var previews: some View {
        GramPost()
    }
}
