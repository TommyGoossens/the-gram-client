//
//  ProfileView.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    let rest = RestService()
    @State var profile:UserProfile? = nil
    @State var posts:[ProfilePostPreview] = []
    @State var Grid: [Int] = []
    
    var body: some View {
        VStack{
            ProfileInformationHeader(profile: self.$profile)
            ProfileViewButtons(user: self.$profile)
            ProfilePostGrid(data: self.$posts, grid: self.$Grid)
        }.onAppear{
            self.fetchUserProfile()
        }
        .padding(0.0)
        
        
    }
    func generateGrid() {
        self.Grid = []
        for i in stride(from: 0, to: (self.profile?.posts.count)!, by: 3){
            if i != self.profile?.posts.count{
                self.Grid.append(i)
            }
        }
    }

    func fetchUserProfile(){
        self.rest.getRequest(endpoint: "profile/UBh7cektzYhSu6s4s6IdEEsNfz63", of: UserProfile.self){data in
            self.profile = data
            self.posts = data.posts
            self.generateGrid()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: UserProfile(userId: "hans", email: "tommygoossens@ziggo.nl", firstName: "Tommy", lastName: "Goossens", userName: "Tommy.Goossens", profilePictureURL: "empty", followers: ["henk"],following: ["piet"], posts: []), posts: [])
    }
}



func fetchUserPosts() -> [ProfilePostPreview]{
    var data:[ProfilePostPreview] = []
    for _ in stride(from: 0, to: 34, by: 1){
        let randomInt = Int.random(in: 0...imageNames.count-1)
        data.append(ProfilePostPreview(id: uint(randomInt),mediaURL: imageNames[randomInt]))
    }
    return data
}

struct GramProfile{
    var userId:String
    let firstName: String
    let surName:String
    let email:String
    let followers:Int
    let following:Int
    
}

//let imageNames = [
//    "appicon",
//    "911",
//    "hitler",
//    "chingchong",
//    "rutte"
//]

let imageNames = [
    "appicon",
    "mountain1",
    "mountain2",
    "mountain3",
    "nature1",
    "nature2",
    "nature3"
]
