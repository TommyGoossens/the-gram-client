//
//  HomeView.swift
//  the-gram
//
//  Created by Tommy Goossens on 10/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack() {
            Group {
                Header(headerText: "The Gram")
                    .padding(.bottom, 0.0)
                List {
                    ForEach(0..<10) { item in
                        GramPost()
                            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
