//
//  ProfileSearchResult.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileSearchResult: View {
    let userName: String
    let profilePictureURL: String
    var body: some View {
        HStack{
            
            CircularProfilePicture(image: MediaDownloader.GetImage(mediaURL: profilePictureURL), height: UIScreen.main.bounds.height/10)
            VStack {
                Text(userName)
                    .multilineTextAlignment(.leading)
                Button(action: {print("Following!")}, label: {Text("Follow")}).padding(.trailing).frame(width: 150)
            }
            Spacer()
            
            
            
        }
        .padding(.horizontal)
    }
}

struct ProfileSearchResult_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSearchResult(userName: "tommy.goossens", profilePictureURL: "https://autototaalbv.nl/wp-content/uploads/2017/04/profile-placeholder.png")
    }
}
