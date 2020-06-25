//
//  CircularProfilePicture.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
struct CircularProfilePicture: View {
    let imageUrl: String
    //let image: UIImage
    let height:CGFloat
    var body: some View {
        KFImage(URL(string: imageUrl)).renderingMode(.original).resizable()
            .frame(width: height, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircularProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfilePicture(imageUrl:"https://autototaalbv.nl/wp-content/uploads/2017/04/profile-placeholder.png",height: 150.0)
    }
}
