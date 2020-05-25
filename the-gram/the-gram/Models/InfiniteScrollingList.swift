//
//  InfiniteScrollingList.swift
//  The Gram
//
//  Created by Tommy Goossens on 25/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation

protocol InfiniteScrollingListValue :Identifiable, Decodable, Equatable {
}

class InfiniteScrollingList<T:InfiniteScrollingListValue> : ObservableObject, RandomAccessCollection{
    
    typealias Element = T
    @Published var listItems = [T]()
    
    private var restService = RestService()
    private let endpoint:String
    
    var startIndex: Int { listItems.startIndex}
    var endIndex: Int { listItems.endIndex}
    
    var body: [String: AnyObject] = [:]
    var currentlyLoading:Bool = false
    
    subscript(position: Int) -> Element {
        return listItems[position]
    }
    
    init(endpoint:String) {
        self.endpoint = endpoint
        self.body.updateValue(1 as AnyObject, forKey: "pageNumber")
    }
    
    func loadInitialResults(requestBody: [String:AnyObject]){
        self.body["pageNumber"] = 1 as AnyObject
              requestBody.forEach { (key,value) in
                  self.body[key] = value
              }
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
        
        self.restService.postRequest(endpoint: self.endpoint,body: body, of: [Element].self) { response in
            DispatchQueue.main.async {
                self.listItems.append(contentsOf: response)
                let currentPage = self.body["pageNumber"] as! Int
                self.body["pageNumber"] = currentPage + 1 as AnyObject
                self.currentlyLoading = false
            }
        }
    }
}
