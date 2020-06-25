//
//  FollowerListItem.swift
//  The Gram
//
//  Created by Tommy Goossens on 04/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct FollowerListItem: View {
    var profile:UserSearchResult
    var body: some View {
        
        HStack{
            NavigationLink(destination: ProfileView(navBarHidden: false, userId:profile.userId)){
                CircularProfilePicture(imageUrl: profile.profilePictureURL, height:50)
                          Text(profile.userName)
            }
            Spacer()
            Button(action: {print("follow")}, label: {Text("Follow")}).padding(5).frame(width:100).border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }.padding(5)
    }
}

struct FollowerListItem_Previews: PreviewProvider {
    static var previews: some View {
        FollowerListItem(profile: UserSearchResult(userId:"1",userName:"tommy.goossens",profilePictureURL:""))
    }
}
