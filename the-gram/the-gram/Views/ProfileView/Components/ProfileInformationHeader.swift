//
//  ProfileInformationHeader.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileInformationHeader: View {
    var profile:UserProfile
    var body: some View {
            HStack {
                CircularProfilePicture(imageUrl:profile.profilePictureURL, height: 100)
                VStack(alignment: .leading){
                    
                    HStack(alignment: .center) {
                        VStack{
                            Text(profile.posts.count.description).font(.callout)
                            Text("posts")
                                .font(.callout)
                        }
                        Spacer()
                        NavigationLink(destination: FollowerListView(userId: self.profile.userId, endpoint: "followers"), label: {
                            VStack{
                                Text(profile.followers.description)
                                    .font(.callout)
                                Text("Followers")
                                    .font(.callout)
                            }
                        })
                        
                        Spacer()
                        NavigationLink(destination: FollowerListView(userId: self.profile.userId, endpoint: "following"), label: {
                            VStack{
                                Text(profile.following.description).font(.callout)
                                Text("Following")
                                    .font(.callout)
                            }
                        })
                        
                    }
                }
            }.padding(.horizontal, 10.0)
            
        
    }
}

struct ProfileInformationHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInformationHeader(profile: UserProfile(userId: "Tommy", email: "Tommy", firstName: "Tommy", lastName: "Tommy", userName: "Tommy", profilePictureURL: "Tommy", followers: 1, following: 1, posts: []))
    }
}
