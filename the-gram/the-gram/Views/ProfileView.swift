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
    @State var data = fetchUserPosts()
    @State var profile:UserProfile? = nil
    @State var Grid: [Int] = []
    
    var body: some View {
        VStack{
        
            ProfileInformationHeader(profile: self.$profile)
//
//
            ProfileViewButtons(user: self.$profile)
//
            ProfilePostGrid(data:self.$data, grid: self.$Grid)
            
            
        }.onAppear{
            self.generateGrid()
            self.rest.getRequest(endpoint: "profile/UBh7cektzYhSu6s4s6IdEEsNfz63", of: UserProfile.self){data in

                self.profile = data
                print(self.profile!.email)
            }
        }
        .padding(0.0)
        
        
    }
    
    func generateGrid() {
        for i in stride(from: 0, to: self.data.count, by: 3){
            if i != self.data.count{
                self.Grid.append(i)
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: UserProfile(userId: "hans", email: "tommygoossens@ziggo.nl", firstName: "Tommy", lastName: "Goossens", userName: "Tommy.Goossens", profilePictureURL: "empty", followers: ["henk"],following: ["piet"]))
    }
}

func fetchUserProfile() -> GramProfile{
    
    return GramProfile(userId:"adolf",firstName: "Tommy", surName: "Goossens", email: "tommygoossens@ziggo.nl", followers: 911, following: 2977)
}

func fetchUserPosts() -> [PostPreview]{
    var data:[PostPreview] = []
    for _ in stride(from: 0, to: 34, by: 1){
        let randomInt = Int.random(in: 0...imageNames.count-1)
        data.append(PostPreview(imageURL: imageNames[randomInt]))
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
