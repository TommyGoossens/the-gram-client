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
    @State var searchTerm: String = ""
    @ObservedObject var searchResults = InfiniteScrollingList<UserSearchResult>(endpoint:"profile/query")
    var body: some View {
        NavigationView{
            VStack{
                createSearchBar()
                if searchResults.count > 0 {
                    
                    List(searchResults) { (result:UserSearchResult) in
                        NavigationLink(destination: ProfileView(navBarHidden: false, userId: result.userId)){
                            ProfileSearchResult(user: result).onAppear{
                                self.searchResults.loadMoreResults(currentItem: result)
                            }
                        }
                    }
                }
                else{
                    if searchTerm != "" {
                        Text("No results found for \(searchTerm)")
                    }
                    Spacer()
                }
            }.navigationBarTitle(Text("")).navigationBarHidden(true).onAppear{
//                self.searchResults.listItems = []
//                self.searchTerm = ""
            }
        }
    }
    
    
    private func createSearchBar() -> SearchBar {
        var searchBar = SearchBar(text: self.$searchTerm, placeholder: "Search for an username")
        searchBar.onSearchTextUpdate = { searchText in
            self.searchTerm = searchText
            if searchText.count >= 3
            {
                self.searchResults.loadInitialResults(pathParams: [searchText], keepCurrentData: false)
            }
        }
        return searchBar
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
