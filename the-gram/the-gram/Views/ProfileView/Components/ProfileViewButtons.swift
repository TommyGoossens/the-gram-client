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
    @EnvironmentObject var appState:Appstate
    var userId:String?
    var restService:RestService = RestService()
    var body: some View {
        HStack{
            if userId == session.session?.uid{
                HStack {
                    HStack{
                        Spacer()
                        Button(action:{
                            self.session.signOut()
                            self.appState.selectedTab = .home
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
                        self.restService.putRequest(endpoint: "profile/followers/\(self.userId!)", body: [:], of: Bool.self){result in
                            print(result)
                        }
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
        ProfileViewButtons(userId: "Tommy").environmentObject(SessionStorage(session: User(uid: "jan", displayName: "TommyGoossens", email: "tommygoossens@ziggo.nl")))
    }
}
