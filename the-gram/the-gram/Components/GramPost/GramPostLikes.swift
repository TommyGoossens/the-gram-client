//
//  GramPostLikes.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostLikes: View {
    var body: some View {
        HStack {
            Text("1938 likes")
                .font(.body)
                .fontWeight(.medium)
                .padding(.leading, 10.0)
            Spacer()
        }
    }
}

struct GramPostLikes_Previews: PreviewProvider {
    static var previews: some View {
        GramPostLikes()
    }
}
