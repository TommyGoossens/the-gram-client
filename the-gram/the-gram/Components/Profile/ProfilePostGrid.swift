//
//  ProfilePostGrid.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfilePostGrid: View {
    @Binding var data:[PostPreview]
    @Binding var grid:[Int]
    var body: some View {
        VStack{
            if !self.grid.isEmpty{
                ScrollView(.vertical,showsIndicators: false){
                    VStack(spacing: 5){
                        ForEach(self.grid, id:\.self){i in
                            HStack{
                                ForEach(i...i+2,id: \.self){j in
                                    VStack{
                                        if j < self.data.count{
                                            PostThumbnail(imageURL: self.data[j].imageURL, postId: self.data[j].id)
                                        }
                                    }
                                    
                                }
                                if i == self.grid.last && self.data.count % 3 != 0{
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                }
            }
            
        }
    }
}
struct ProfilePostGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostGrid(data: .constant([PostPreview(imageURL: "appicon")]), grid: .constant([1]) )
    }
}


struct PostPreview: Identifiable {
    let id:Int64 = 1
    let imageURL: String
}
