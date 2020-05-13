//
//  ProfilePostGrid.swift
//  The Gram
//
//  Created by Tommy Goossens on 20/04/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct ProfilePostGrid: View {
    @Binding var data:[ProfilePostPreview]
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
                                            PostThumbnail(post: self.data[j]).onAppear{
                                                print("------")
                                                self.test(i: i, j: j)
                                            }
                                        }
                                    }
                                    
                                }
                                if i == self.grid.last && self.data.count % 3 != 0{
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }.onAppear{
                        print("Page load")
                    }
                }
            } else {
                Spacer()
            }
            
        }
    }
    
    func test(i: Int, j: Int){
        
        print("i: \(i)")
        
        print("j: \(j)")
    }
}
struct ProfilePostGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostGrid(data: .constant([ProfilePostPreview(id:1,mediaURL: "https://firebasestorage.googleapis.com/v0/b/the-gram-c0daa.appspot.com/o/posts%2FUBh7cektzYhSu6s4s6IdEEsNfz63%2FUBh7cektzYhSu6s4s6IdEEsNfz63-5248933827683178974.jpg?alt=media&token=dcb50930-f56a-4500-8f40-83b5d970693d")]), grid: .constant([1]) )
    }
}
