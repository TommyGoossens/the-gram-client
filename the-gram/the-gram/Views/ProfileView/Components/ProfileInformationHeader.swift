//
//  ProfileInformationHeader.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileInformationHeader: View {
    @Binding var profile:UserProfile?
    var body: some View {
        VStack {
            if profile != nil {
        
                VStack {
                    HStack {
                        Text("\(self.profile?.firstName ?? "Firstname")")
                            .font(.body)
                        Text("\(profile?.lastName ?? "Lastname")")
                            .font(.body)
                    }
                    Text("\(profile?.userName ?? "Username")")
                        .font(.body)
                }
                HStack {
                    CircularProfilePicture(image: MediaDownloader.GetImage(mediaURL: profile!.profilePictureURL), height: 100)
                    VStack(alignment: .leading){
                        
                        HStack(alignment: .center) {
                            VStack{
                                Text("5").font(.callout)
                                Text("posts")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack{
                                Text(profile!.followers.count.description)
                                    .font(.callout)
                                Text("Followers")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack{
                                Text(profile!.following.count.description).font(.callout)
                                Text("Following")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 10.0)
    }
}

struct ProfileInformationHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInformationHeader(profile: .constant(UserProfile(userId: "tommy", email: "tommygoossens@ziggo.nl", firstName: "Tommy", lastName: "Goossens", userName: "henk", profilePictureURL:"https://autototaalbv.nl/wp-content/uploads/2017/04/profile-placeholder.png", followers: ["911"], following: ["2977"], posts: [])))
    }
}
