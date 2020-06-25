//
//  ProfileView.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profile: ObservableViewModelHack<UserProfile>
    let navBarHidden: Bool
    let userId: String
    @State var posts:[Post] = []
    @State var Grid: [Int] = []
    
    init(navBarHidden: Bool, userId:String) {
        self.navBarHidden = navBarHidden
        self.userId = userId
        profile = ObservableViewModelHack<UserProfile>(endpoint: "profile/\(userId)")
    }
    
    var body: some View {
        VStack{
            if self.profile.count > 0 {
                VStack{
                    NavigationView{
                        VStack{
                            ProfileInformationHeader(profile: self.profile[0])
                            ProfileViewButtons(userId: self.profile[0].userId)
                            ProfilePostGrid(data: self.$posts, grid: self.$Grid)
                        }.navigationBarTitle(Text(self.profile[0].userName), displayMode: .inline).navigationBarHidden(!self.navBarHidden)
                    }.onAppear{
                        self.posts = self.profile[0].posts
                        self.generateGrid()
                    }
                }.navigationBarTitle(Text(self.profile[0].userName), displayMode: .inline).navigationBarHidden(self.navBarHidden)
                
                .padding(0.0)
            } else {
                Text("Loading...")
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
                
        }.onAppear{
            self.profile.fetchList(pathParams: [])
        }
    }
    func generateGrid() {
        self.Grid = []
        for i in stride(from: 0, to: (self.profile[0].posts.count), by: 3){
            if i != self.profile[0].posts.count{
                self.Grid.append(i)
            }
        }
    }
    
//    func fetchUserProfile(){
//        self.rest.getRequest(endpoint: "profile/\(userId)", of: UserProfile.self){data in
//            self.profile = data
//            self.posts = data.posts
//            print("Data is received on \(Date.init())")
//            self.generateGrid()
//        }
//    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(navBarHidden: true, userId: "UBh7cektzYhSu6s4s6IdEEsNfz63")
    }
}
