//
//  GramPost.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
struct GramFeedPost: View {
    let post:Post
    @State var profileNavIsActive = false;
    @State var postDetailNavIsActive = false
    init(post:Post) {
        self.post = post
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            Button(action: {self.profileNavIsActive = true}, label: {
                NavigationLink(destination: ProfileView(navBarHidden: false, userId: post.user.userId), isActive: self.$profileNavIsActive){
                    GramPostHeader(profile: post.user)
                }
            })
            Button(action: {self.postDetailNavIsActive = true}, label: {
                NavigationLink(destination: PostDetailView(post: post), isActive: self.$postDetailNavIsActive,label: {
                    KFImage(URL(string: post.mediaURL)).renderingMode(.original).resizable()
                        .frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.width)
                })})
            GramPostButtons(postId: post.postId, likedPic: post.postLikedByAuthUser, datePosted: post.datePosted)
                .padding(.top, 5.0)
            Group {
                GramPostLikes(numberOfLikes: post.likes)
                    .padding(.top, 5.0)
                HStack {
                    Text(post.description)
                        .font(.callout)
                        .fontWeight(.regular)
                    Spacer()
                }
                .padding(.bottom, 5.0)
                GramPostCommentsPreview(numberOfComments: post.comments)
                    .padding(.top, 5.0)
            }
        }
    }
}

struct GramPost_Previews: PreviewProvider {
    static var previews: some View {
        GramFeedPost(post: mockPost)
    }
}

let mockUser = GramPostProfile(userId: "tommy.goossens", userName: "tommy.goossens", profilePictureURL: "https://firebasestorage.googleapis.com/v0/b/the-gram-c0daa.appspot.com/o/posts%2FUBh7cektzYhSu6s4s6IdEEsNfz63%2FUBh7cektzYhSu6s4s6IdEEsNfz63-5248970366948227432.jpg?alt=media&token=97eb5f3e-4d1c-40c5-8db4-5d506a503ea1")

let mockPost = Post(postId:1,user: mockUser, mediaURL:"https://firebasestorage.googleapis.com/v0/b/the-gram-c0daa.appspot.com/o/posts%2FUBh7cektzYhSu6s4s6IdEEsNfz63%2FUBh7cektzYhSu6s4s6IdEEsNfz63-5248970366948227432.jpg?alt=media&token=97eb5f3e-4d1c-40c5-8db4-5d506a503ea1", datePosted:Date(),description:"disc",likes:0,comments:0,postLikedByAuthUser:false )

