//
//  PostView.swift
//  The Gram
//
//  Created by Tommy Goossens on 15/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct NewPostView: View {
    @State var selectedImage: Image? = nil
    @State var description: String = ""
    @State private var showImagePicker: Bool = false
    

    var body: some View {
        VStack {
            Text("Post a new picture")
                .font(.largeTitle)
            Spacer()
            VStack {
                PicturePreview(image: self.$selectedImage)
                if self.selectedImage != nil{
                    PostDescription(description: $description)
                }
            }
            
            HStack {
                SelectPicture(image:self.$selectedImage)
                if self.selectedImage != nil {
                    Button("Post Image"){
                        self.showImagePicker = true
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

#if DEBUG
struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
#endif
