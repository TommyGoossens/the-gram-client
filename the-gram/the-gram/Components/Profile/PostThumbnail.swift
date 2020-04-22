//
//  PostThumbnail.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct PostThumbnail: View {
    let imageURL: String
    let postId: Int64
    var body: some View {
        
        Button(action:{
            print("Image")
        }, label: {
            Image(imageURL)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 3, height:UIScreen.main.bounds.width / 3,alignment: .center)
                .clipped()
                
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).scaledToFit()
        })
        
    }
    
    
}

struct PostThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        PostThumbnail(imageURL: "appicon", postId: 1)
    }
}