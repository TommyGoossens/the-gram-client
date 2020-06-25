//
//  GramPostButtons.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct GramPostButtons: View {
    private var restService:RestService = RestService()
    let dateFormatter = DateFormatter()
    let postId:Int
    var datePosted: Date = Date.init()
    var likedPic: Bool
    let buttonSize: CGFloat = 22.5
    
    init(postId: Int,likedPic: Bool, datePosted: Date) {
        self.postId = postId
        self.datePosted = datePosted
        self.dateFormatter.dateFormat = "HH:mm EEEE, d MMM y"
        self.likedPic = likedPic
        
    }
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    self.likePicture()
                }){
                    Image(systemName: likedPic ? "heart.fill" : "heart" ).resizable()
                        .frame(width: buttonSize, height: buttonSize).foregroundColor(likedPic ? .red : .black)
                    
                }
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
            Text("\(dateFormatter.string(from: datePosted))")
                .font(.subheadline)
        }
        .padding(.horizontal, 10.0)
    }
    
     func likePicture(){
        self.restService.putRequest(endpoint: "post/like/\(self.postId)", body: [:], of: Bool.self){ response in
            print(response)
        }
    }
}

struct GramPostButtons_Previews: PreviewProvider {
    static var previews: some View {
        GramPostButtons(postId: 1, likedPic: false, datePosted: Date())
    }
}
