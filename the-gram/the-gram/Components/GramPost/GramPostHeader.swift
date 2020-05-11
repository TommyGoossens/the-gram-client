//
//  GramPostHeader.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostHeader: View {
    var body: some View {
        HStack {
            CircularProfilePicture(height: 50.0)
            Text("Tommy Goossens")
                .font(.body)
            Spacer()
        }
        .padding(.leading, 5.0)
    }
}

struct GramPostHeader_Previews: PreviewProvider {
    static var previews: some View {
        GramPostHeader()
    }
}
