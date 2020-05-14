//
//  GramPost.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPost: View {
    let profile: GramPostProfile = GramPostProfile(userName: "tommy", profilePictureURL: "https://autototaalbv.nl/wp-content/uploads/2017/04/profile-placeholder.png")
    var body: some View {
        VStack(spacing: 0.0) {
            GramPostHeader(profile: profile)
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

let imageNames = [
    "appicon",
    "mountain1",
    "mountain2",
    "mountain3",
    "nature1",
    "nature2",
    "nature3"
]
