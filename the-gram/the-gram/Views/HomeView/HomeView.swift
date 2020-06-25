//
//  HomeView.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    private let restService:RestService = RestService()
    @ObservedObject var feedPosts = InfiniteScrollingList<Post>(endpoint:"feed")
    var body: some View {
        VStack{
            if self.feedPosts.count > 0{
                NavigationView{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing:5){
                            ForEach(self.feedPosts, id:\.postId){ post in
                                GramFeedPost(post: post)
                            }
                        }
                        }.navigationBarTitle("").navigationBarHidden(true)
                }
                
            }
            else{
                Spacer()
                Text("There are no posts to view.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text("Perhaps you can follow some new users?")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }.onAppear{
            self.feedPosts.loadInitialResults(pathParams: [], keepCurrentData: true)
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
