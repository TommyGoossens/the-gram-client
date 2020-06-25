//
//  InfiniteScrollingList.swift
//  The Gram
//
//  Created by Tommy Goossens on 25/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation

protocol ObvservableListItem :Identifiable, Decodable, Equatable {
}

class InfiniteScrollingList<T:ObvservableListItem> : ObservableObject, RandomAccessCollection{
    
    typealias Element = T
    @Published var listItems = [T]()
    
    private let restService = RestService()
    private let endpoint:String
    
    var startIndex: Int { listItems.startIndex}
    var endIndex: Int { listItems.endIndex}
    
    var pageNumber = 1
    var params:[String] = []
    var currentlyLoading:Bool = false
    
    subscript(position: Int) -> Element {
        return listItems[position]
    }
    
    init(endpoint:String) {
        self.endpoint = endpoint
    }
    
    func loadInitialResults(pathParams: [String], keepCurrentData:Bool){
        self.pageNumber = 1
        self.params = pathParams
        
            DispatchQueue.main.async {
                self.listItems.removeAll()
            }
        
            loadMoreResults()
    }
    
    func shouldLoadMoreData(currentItem: T? = nil) -> Bool{
        if currentlyLoading{
            return false
        }
        
        guard let currentItem = currentItem else {
            return true
        }
        
        guard let lastItem = listItems.last else {
            return true
        }
        
        return currentItem.id == lastItem.id
    }
    
    
    func loadMoreResults(currentItem: T? = nil){
        
        if !shouldLoadMoreData(currentItem: currentItem) {
            return
        }
        currentlyLoading = true
        var urlParams = "\(self.pageNumber)"
        for i in stride(from: 0, to: self.params.count, by: 1){
            urlParams += "/\(self.params[i])"
        }
        print("\(self.endpoint)/\(urlParams)")
        self.restService.getRequest(endpoint: "\(self.endpoint)/\(urlParams)", of: [Element].self) { response in
            DispatchQueue.main.async {
                self.listItems.append(contentsOf: response)
                self.pageNumber +=  1
                self.currentlyLoading = false
            }
        }
    }
}
