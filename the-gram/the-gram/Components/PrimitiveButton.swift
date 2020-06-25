//
//  PrimitiveButton.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct PrimitiveButton: ButtonStyle {
    let isCancelButton: Bool
    
    let colorCancel: Color = Color.red
    let colorConfirm: Color = Color.green
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(self.isCancelButton ? self.colorCancel : self.colorConfirm))
            .compositingGroup()
                 .shadow(color: .black, radius: 3)
                 .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct PrimitiveButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Button(action: {print("button")}, label: {Text("press me")}).buttonStyle(PrimitiveButton(isCancelButton: false)).padding()
            Button(action: {print("button")}, label: {Text("press me")}).buttonStyle(PrimitiveButton(isCancelButton: true)).padding()
        }
    }
}
