//
//  PicturePreview.swift
//  The Gram
//
//  Created by Tommy Goossens on 18/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct PicturePreview: View {
    @Binding var image: UIImage?
    var body: some View {
        Group{
                    
            if image != nil {
                Image(uiImage: image!).resizable().aspectRatio(contentMode: .fill).frame(width:300, height: 300, alignment: .center)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 4))
                    .shadow(radius: 10)
            } else{
                EmptyView()
            }
        }
    }
}

struct PicturePreview_Previews: PreviewProvider {
    static var previews: some View {
        PicturePreview(image: .constant(UIImage(named: "appicon")))
    }
}
