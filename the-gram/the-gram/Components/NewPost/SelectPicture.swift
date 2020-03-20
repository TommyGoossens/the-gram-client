//
//  SelectPicture.swift
//  The Gram
//
//  Created by Tommy Goossens on 18/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct SelectPicture: View {
    @State var showImagePicker: Bool = false
    @Binding var image: Image?
    
    var body: some View {
        VStack {
            Button(action: {self.showImagePicker = true}){
                //Image(systemName: "camera.on.rectangle.fill").resizable().frame(width:25, height: 25)
                Text(image == nil ? "Take a picture" : "Retake the picture")
                
            }.padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker){
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
        }
    }
}

struct SelectPicture_Previews: PreviewProvider {
    static var previews: some View {
        SelectPicture(showImagePicker: false, image: .constant(Image("")))
    }
}
