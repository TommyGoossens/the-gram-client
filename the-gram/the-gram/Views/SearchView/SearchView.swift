//
//  SearchView.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var searchTerm: String = ""
    var body: some View {
        VStack{
            TextField("Search for user", text: $searchTerm).padding(.all, 5).overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 0.2)
            )
            NavigationView{
                List(1...5,id: \.self) {result in
                    NavigationLink(destination: ProfileView(userId: "UBh7cektzYhSu6s4s6IdEEsNfz63")){
                        ProfileSearchResult(userName: "test", profilePictureURL: "test.jpg")
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 5.0)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
