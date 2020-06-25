//
//  PostComment.swift
//  The Gram
//
//  Created by Tommy Goossens on 23/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct PostComment: View {
    let comment: Comment
    let dateFormatter: DateFormatter = DateFormatter()
    
    init(comment:Comment) {
        self.comment = comment
        print(comment.message)
        self.dateFormatter.dateFormat = "d MMM y : HH:mm"
    }
    var body: some View {
        VStack{
            HStack{
                Text(self.comment.userName)
                    .font(.body)
                    .fontWeight(.medium)
                Text(self.comment.message)
                    .font(.body)
                    .fontWeight(.light)
                Spacer()
            }
            HStack{
                Text(self.dateFormatter.string(from:self.comment.dateOfComment))
                    .font(.caption)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }.padding(5)
    }
}

struct PostComment_Previews: PreviewProvider {
    static var previews: some View {
        PostComment(comment: Comment(userId: "", userName: "Tommy", dateOfComment: Date.init(), message: "Mooie foto!"))
    }
}
