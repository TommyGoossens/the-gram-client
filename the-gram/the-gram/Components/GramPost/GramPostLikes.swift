//
//  GramPostLikes.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostLikes: View {
    let numberOfLikes:Int
    var body: some View {
        HStack {
            Text("\(numberOfLikes) \(numberOfLikes == 1 ? "like" : "likes")")
                .font(.body)
                .fontWeight(.medium)
                .padding(.leading, 10.0)
            Spacer()
        }
    }
}

struct GramPostLikes_Previews: PreviewProvider {
    static var previews: some View {
        GramPostLikes(numberOfLikes: 1940)
    }
}
