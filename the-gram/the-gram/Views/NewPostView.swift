//
//  PostView.swift
//  The Gram
//
//  Created by Tommy Goossens on 15/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import FirebaseStorage
struct NewPostView: View {
    let rest = RestService()
    
    @State var selectedImage: UIImage? = nil
    @State var description: String = ""
    @State private var showImagePicker: Bool = false
    
    
    var body: some View {
        KeyboardHost{
            VStack {
                Text("Post a new picture")
                    .font(.largeTitle)
                Spacer()
                VStack {
                    PicturePreview(image: self.$selectedImage)
                    if self.selectedImage != nil{
                        PostDescription(description: self.$description).padding()
                    }
                }
                
                HStack {
                    SelectPicture(image:self.$selectedImage)
                    if self.selectedImage != nil {
                        Button("Post Image"){
                            self.postImage()
                        }.padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
        }
    }
    
    func postImage(){
        if(self.selectedImage != nil){
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let post: NewGramPost = NewGramPost(Image: self.selectedImage!, Description: self.description, DatePosted: df.string(from: Date()), UserUID: "tommygoossens123")
            print("Making request")
//            PostService.create(for: self.selectedImage!)
            self.rest.uploadImage(newPost: post)
//            self.rest.getRequest(endpoint: "post/getspecificpost")
            
        }
    }
}

#if DEBUG
struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
#endif
