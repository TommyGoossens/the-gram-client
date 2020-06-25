//
//  FollowerProfile.swift
//  The Gram
//
//  Created by Tommy Goossens on 23/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct FollowerProfile: View {
      let userId: String
      let rest = RestService()
      @State var profile:UserProfile? = nil
      @State var posts:[ProfilePostPreview] = []
      @State var Grid: [Int] = []
      
      var body: some View {
          VStack{
              ProfileInformationHeader(profile: self.$profile)
              ProfileViewButtons(user: self.$profile)
              ProfilePostGrid(data: self.$posts, grid: self.$Grid)
            }.navigationBarTitle(Text("Username"), displayMode: .inline).navigationBarHidden(false)
          .onAppear{
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
          self.rest.getRequest(endpoint: "profile/\(userId)", of: UserProfile.self){data in
              self.profile = data
              self.posts = data.posts
              print("Data is received on \(Date.init())")
              self.generateGrid()
          }
      }
}

struct FollowerProfile_Previews: PreviewProvider {
    static var previews: some View {
        FollowerProfile(userId: "UBh7cektzYhSu6s4s6IdEEsNfz63")
    }
}
