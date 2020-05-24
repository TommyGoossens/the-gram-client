//
//  SearchView.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    private let restService:RestService = RestService()
    @State var pageNumber = 1
    @State var searchTerm: String = ""
    @State var searchResults: [UserSearchResult] = []
    
    var body: some View {
        NavigationView{
            VStack{
                createSearchBar()
                if searchResults.count > 0 {
                    SearchResultList(searchResults: $searchResults)
                }
                else{
                    if searchTerm != "" {
                        Text("No results found for \(searchTerm)")
                    }
                    Spacer()
                }
            }.navigationBarTitle("").navigationBarHidden(true)
            
        }
    }
    
    private func createSearchBar() -> SearchBar {
        var searchBar = SearchBar(text: self.$searchTerm, placeholder: "Search for an username")
        searchBar.onSearchTextUpdate = { searchText in
            self.searchTerm = searchText
            if searchText.count >= 3
            {
                self.queryUsers(searchText: searchText)
            }
        }
        return searchBar
    }
    
    private func queryUsers(searchText:String) -> Void {
        let body: [String: AnyObject] = [
            "searchTerm":searchText as AnyObject,
            "pagNumber":self.pageNumber as AnyObject
        ]
        self.restService.postRequest(endpoint: "profile/query/",body: body, of: [UserSearchResult].self) { response in
            self.searchResults = response
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
