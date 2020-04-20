//
//  PostView.swift
//  The Gram
//
//  Created by Tommy Goossens on 15/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
struct NewPostView: View {
    let rest = RestService()
    
    @State var selectedImage: UIImage? = nil
    @State var description: String = ""
    @State private var showImagePicker: Bool = false
    @Binding var isDisplaying: Bool
    
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
            let post: NewGramPost = NewGramPost(Image: self.selectedImage!, Description: self.description)
            self.rest.uploadImage(newPost: post) { success in
                if success{ print("post uploaded")
                    self.isDisplaying.toggle()
                }
            }
        }
    }
}

#if DEBUG
struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(isDisplaying: .constant(false))
    }
}
#endif
