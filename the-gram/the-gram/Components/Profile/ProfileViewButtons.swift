//
//  ProfileViewButtons.swift
//  The Gram
//
//  Created by Tommy Goossens on 22/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfileViewButtons: View {
    @EnvironmentObject var session: SessionStorage
    @Binding var selectedUserId:String
    var body: some View {
        HStack{
            if selectedUserId == session.session?.uid{
                HStack {
                    HStack{
                        Spacer()
                        Button(action:{
                            print("Logging out")
                        }, label: {
                            Text("Logout")
                                .font(.callout)
                        }).padding(5).frame(width:100)
                        Spacer()
                        Button(action:{
                            print("Edit")
                        }, label: {
                            Text("Edit")
                                .font(.callout)
                        }).padding(5).frame(width:100).border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                }
            } else{
                HStack{
                    Spacer()
                    Button(action:{
                        print("Follow")
                    }, label: {
                        Text("Follow")
                            .font(.callout)
                    }).padding(5).frame(width:100).border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button(action:{
                        print("Message")
                    }, label: {
                        Text("Message")
                            .font(.callout)
                    }).padding(5).frame(width:100).border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
        }
    }
    
}

struct ProfileViewButtons_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewButtons(selectedUserId: .constant("jan")).environmentObject(SessionStorage(session: User(uid: "jan", displayName: "TommyGoossens", email: "tommygoossens@ziggo.nl")))
    }
}
