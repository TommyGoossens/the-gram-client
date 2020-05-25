//
//  SearchResultList.swift
//  The Gram
//
//  Created by Tommy Goossens on 17/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct SearchResultList: View {
    @Binding var searchResults: [UserSearchResult]
    var body: some View {
        List(searchResults, id: \.userId) {result in
            NavigationLink(destination: ProfileView(userId: result.userId)){
                ProfileSearchResult(user: result)
            }
        }
    }
}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultList(searchResults: .constant([]))
    }
}
