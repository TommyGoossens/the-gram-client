//
//  PostThumbnail.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct PostThumbnail: View {
    var post: ProfilePostPreview
    var body: some View {
        HStack {
            Button(action:{
                print("Image")
            }, label: {
                Image(uiImage: MediaDownloader.GetImage(mediaURL: post.mediaURL))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 3, height:UIScreen.main.bounds.width / 3,alignment: .center)
                    .clipped()
                    
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).scaledToFit()
            }).onAppear{
                print("Image id \(self.post.id) is displayed on \(Date.init())")
            }
        }
    }
    
}



struct PostThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        PostThumbnail(post: ProfilePostPreview(id: 1, mediaURL: "https://firebasestorage.googleapis.com/v0/b/the-gram-c0daa.appspot.com/o/posts%2FUBh7cektzYhSu6s4s6IdEEsNfz63%2FUBh7cektzYhSu6s4s6IdEEsNfz63-5248933827683178974.jpg?alt=media&token=dcb50930-f56a-4500-8f40-83b5d970693d"))
    }
}
