//
//  SwiftUIView.swift
//  The Gram
//
//  Created by Tommy Goossens on 23/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
struct PostDetailView: View {
    private var restService: RestService = RestService()
    let post:Post
    @State var commentToPlace: String = ""
    @ObservedObject var comments: InfiniteScrollingList<Comment>
    
    init(post:Post) {
        self.post = post;
        comments  = InfiniteScrollingList<Comment>(endpoint:"post/\(post.postId)/comment")
    }
    
    
    var body: some View {
        VStack{
            KFImage(URL(string: post.mediaURL)).resizable()
                .frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.width)
            GramPostButtons(postId: post.postId, likedPic: post.postLikedByAuthUser, datePosted: post.datePosted)
            GramPostLikes(numberOfLikes: post.likes)
            GramPostCommentsPreview(numberOfComments: post.comments)
            if self.comments.count > 0 {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 5){
                        ForEach(self.comments, id:\.id){ comment in
                            PostComment(comment: comment)
                        }
                    }
                    
                }
            } else{
                Spacer()
            }
            HStack{
                TextField("Comment", text: $commentToPlace).font(.body).textFieldStyle(PlainTextFieldStyle())
                Button(action: {
                    let body = ["comment":self.commentToPlace as AnyObject]
                    self.restService.postRequest(endpoint: "post/\(self.post.postId)/comment", body: body, of: Comment.self){ result in
                        self.comments.listItems.insert(result, at: 0)
                    }
                    self.commentToPlace = ""
                }, label: {Image(systemName: "paperplane").resizable()
                    .frame(width: 25, height: 25).foregroundColor(.black)})
            }.padding(.horizontal, 10)
            
        }.navigationBarTitle(Text(post.user.userName), displayMode: .inline)
            .onAppear{
                self.comments.loadInitialResults(pathParams: [], keepCurrentData: false)
        }
    }
    
}

struct PostDetailView_Previews: PreviewProvider {

    static var previews: some View {
        PostDetailView(post: mockPost)
    }
}
