//
//  GramPostHeader.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostHeader: View {
    let profile: GramPostProfile
    var body: some View {
        HStack {
            CircularProfilePicture(image: MediaDownloader.GetImage(mediaURL: profile.profilePictureURL), height: 50.0)
            Text(profile.userName)
                .font(.body)
            Spacer()
        }
        .padding(.leading, 5.0)
    }
}

struct GramPostHeader_Previews: PreviewProvider {
    static var previews: some View {
        GramPostHeader(profile: GramPostProfile(userName: "tommy", profilePictureURL: "https://autototaalbv.nl/wp-content/uploads/2017/04/profile-placeholder.png"))
    }
}
