//
//  ProfileInformationHeader.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileInformationHeader: View {
    @Binding var profile:GramProfile
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(profile.firstName)
                        .font(.body)
                    Text(profile.surName)
                        .font(.body)
                }
                Text(profile.email)
                         .font(.body)
            }
            HStack {
                CircularProfilePicture(height: 100)
                VStack(alignment: .leading){
                    
                    HStack(alignment: .center) {
                        VStack{
                            Text("5").font(.callout)
                            Text("posts")
                                .font(.callout)
                        }
                        Spacer()
                        VStack{
                            Text("\(profile.followers)")
                            .font(.callout)
                            Text("Followers")
                            .font(.callout)
                        }
                        Spacer()
                        VStack{
                            Text("\(profile.following)").font(.callout)
                            Text("Following")
                            .font(.callout)
                        }
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal, 10.0)
    }
}

struct ProfileInformationHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInformationHeader(profile: .constant(GramProfile(userId: "Adolf", firstName: "Tommy", surName: "Goossens", email: "tommygoossens@ziggo.nl", followers: 911, following: 2977)))
    }
}
