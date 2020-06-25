//
//  RefreshScrollView.swift
//  The Gram
//
//  Created by Tommy Goossens on 25/06/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import UIKit
import SwiftUI

struct RefreshScrollView: UIViewRepresentable {
    var width: CGFloat
    var height: CGFloat
    
    var listItems: InfiniteScrollingList<Post>
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.refreshControl = UIRefreshControl()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefreshControl(sender:)), for: .valueChanged)
        
        let refreshVC = UIHostingController(rootView: FeedPostListView(feedPosts: listItems))
        refreshVC.view.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        
        scrollView.addSubview(refreshVC.view)
        return scrollView
    }
    
    
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, listItems: listItems)
    }
    
    class Coordinator: NSObject {
        var refreshScrollView:RefreshScrollView
        var listItems: InfiniteScrollingList<Post>
        
        init(_ refreshScrollView:RefreshScrollView, listItems:InfiniteScrollingList<Post>){
            self.refreshScrollView = refreshScrollView
            self.listItems = listItems
        }
        
        @objc func handleRefreshControl(sender:UIRefreshControl){
            sender.endRefreshing()
            listItems.loadInitialResults(pathParams: listItems.params, keepCurrentData: false)
        }
        
    }
    
}
