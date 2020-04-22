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
            Image(getRandomImage()).resizable()
                .frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.width)
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

func getRandomImage() -> String{
    return imageNames[Int.random(in: 0...imageNames.count-1)]
}
