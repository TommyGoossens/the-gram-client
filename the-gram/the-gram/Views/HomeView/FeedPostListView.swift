//
//  FeedPostListView.swift
//  The Gram
//
//  Created by Tommy Goossens on 25/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct FeedPostListView: View {
    @ObservedObject var feedPosts: InfiniteScrollingList<Post>
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:5){
                ForEach(self.feedPosts, id:\.postId){ post in
                    GramFeedPost(post: post)
                }
            }
            
        }
    }
}
