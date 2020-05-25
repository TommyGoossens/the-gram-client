//
//  PostDescription.swift
//  The Gram
//
//  Created by Tommy Goossens on 18/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct PostDescription: View {
    @Binding var description:String
    var body: some View {
        VStack{
            VStack {
                MultiLineTextView(placeholderText: "Description", text: $description).frame(numLines: 4).padding(5).overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 0.2)
                    )
            }

        }
        .padding(.horizontal)
    }
}

struct PostDescription_Previews: PreviewProvider {
    static var previews: some View {
        PostDescription(description: .constant(""))
    }
}
