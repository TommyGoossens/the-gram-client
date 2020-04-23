//
//  GramPostCommentsPreview.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostCommentsPreview: View {
    var body: some View {
        VStack {
            HStack {
                Text("tommy.goossens")
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding(.leading, 10.0)
                Text("Look at the view!")
                    .font(.callout)
                    .fontWeight(.regular)
                Spacer()
            }
            .padding(.bottom, 5.0)
            HStack{
                Text("View all 1940 comments")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 10.0)
                Spacer()
            }
        }
    }
}

struct GramPostCommentsPreview_Previews: PreviewProvider {
    static var previews: some View {
        GramPostCommentsPreview()
    }
}
