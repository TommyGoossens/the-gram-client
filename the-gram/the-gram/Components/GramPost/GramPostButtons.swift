//
//  GramPostButtons.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostButtons: View {
    let buttonSize: CGFloat = 22.5
    var body: some View {
        HStack {
            HStack {
                Button(action: {}){
                    Image(systemName: "heart.fill").resizable()
                        .frame(width: buttonSize, height: buttonSize).foregroundColor(.red)                }
                    .padding(.trailing, 10.0)
                Button(action: {}){
                    Image(systemName: "message").resizable()
                        .frame(width: buttonSize, height: buttonSize).foregroundColor(.black)
                }.padding(.trailing, 10.0)
                Button(action: {}){
                    Image(systemName: "paperplane").resizable()
                        .frame(width: buttonSize, height: buttonSize).foregroundColor(.black)
                }
            }
            .padding(0.0)
            Spacer()
            Text("Posted yesterday")
                .font(.subheadline)
        }
        .padding(.horizontal, 10.0)
    }
}

struct GramPostButtons_Previews: PreviewProvider {
    static var previews: some View {
        GramPostButtons()
    }
}
