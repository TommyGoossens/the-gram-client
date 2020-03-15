//
//  Header.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct Header: View {
    let headerText:String
    var body: some View {
        Text(headerText)
            .font(.title)
            .lineLimit(nil)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(headerText: "Home")
    }
}
