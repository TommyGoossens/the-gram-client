//
//  ProfileSearchResult.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileSearchResult: View {
    let user: UserSearchResult
    var body: some View {
        HStack{
            CircularProfilePicture(image: MediaDownloader.GetImage(mediaURL: user.profilePictureURL), height: UIScreen.main.bounds.height/15)
            VStack {
                Text(user.userName)
                    .font(.body)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            
            
            
        }
    }
}

struct ProfileSearchResult_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSearchResult(user: tempUser)
    }
}

let tempUser:UserSearchResult = UserSearchResult(userId: "1",userName: "tommy.goossens", profilePictureURL: "no_pic")
