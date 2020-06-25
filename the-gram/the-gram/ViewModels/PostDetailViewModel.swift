//
//  PostDetailViewModel.swift
//  The Gram
//
//  Created by Tommy Goossens on 24/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
class PostDetailViewModel : ObservableObject{
    @Published var post: Post
    private let restService = RestService()

    
    func load(postId: Int){
        self.restService.getRequest(endpoint: "post/\(postId)", of: Post.self) { response in
            DispatchQueue.main.async {
                self.post = response
            }
        }
    }
}
