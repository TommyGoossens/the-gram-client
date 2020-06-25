//
//  GramPostCommentsPreview.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostCommentsPreview: View {
    let numberOfComments: Int
    var body: some View {
        VStack {
            HStack{
                Text("\(numberOfComments) \(numberOfComments == 1 ? "comment" : "comments")")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    
                Spacer()
            }
        }.padding(.leading, 10.0)
    }
}

struct GramPostCommentsPreview_Previews: PreviewProvider {
    static var previews: some View {
        GramPostCommentsPreview(numberOfComments: 1)
    }
}
