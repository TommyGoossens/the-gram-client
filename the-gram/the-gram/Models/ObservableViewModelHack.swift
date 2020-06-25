//
//  ObservableViewModelHack.swift
//  The Gram
//
//  Created by Tommy Goossens on 25/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
class ObservableViewModelHack<T:ObvservableListItem>: ObservableObject, RandomAccessCollection{
    typealias Element = T
    
    @Published var listItems = [T]()
    var startIndex: Int { listItems.startIndex}
    var endIndex: Int { listItems.endIndex}
    subscript(position: Int) -> Element {
        return listItems[position]
    }
    
    private let restService = RestService()
    private let endpoint:String
    var currentlyLoading:Bool = false
    
    init(endpoint:String) {
        self.endpoint = endpoint
    }
    
    func fetchList(pathParams: [String]){
        
        if currentlyLoading{
            return
        }
        DispatchQueue.main.async {
            self.listItems.removeAll()
        }
        var urlParams: String = ""
        for i in stride(from: 0, to: pathParams.count, by: 1){
            urlParams += "/\(pathParams[i])"
        }
        print("\(self.endpoint)/\(urlParams)")
        self.restService.getRequest(endpoint: "\(self.endpoint)/\(urlParams)", of: Element.self){response in
            DispatchQueue.main.async {
                self.listItems.append(response)
                self.currentlyLoading = false
            }
        }
    }
}
