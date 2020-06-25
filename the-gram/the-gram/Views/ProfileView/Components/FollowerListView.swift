//
//  FollowerListView.swift
//  The Gram
//
//  Created by Tommy Goossens on 04/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct FollowerListView: View {
    @ObservedObject var results: ObservableList<UserSearchResult>
    var endpoint: String = ""
    init(userId: String, endpoint:String) {
        self.endpoint = endpoint
        results = ObservableList<UserSearchResult>(endpoint:"profile/\(userId)/\(endpoint)")
    }
    var body: some View {
        VStack{
            if results.count > 0 {
                List(results) { (result:UserSearchResult) in
                    NavigationLink(destination: ProfileView(navBarHidden: false, userId: result.userId)){
                        ProfileSearchResult(user: result)
                    }
                    }.navigationBarTitle(Text("\(endpoint)"), displayMode: .inline).navigationBarHidden(false)
            }
            else{
                VStack{
                    Text("No \(endpoint) yet")
                }
            }
        }.onAppear{
            self.results.fetchList(pathParams:[])
        }
    }
}

struct FollowerListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerListView(userId: "id", endpoint: "followers")
    }
}
