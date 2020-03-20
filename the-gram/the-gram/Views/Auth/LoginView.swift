//
//  LoginView.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
}



#if DEBUG
struct LoginView_Previews: PreviewProvider {
    @State static var email = "tommygoossens@ziggo.nl"
    @State static var password = "123456"
    static var previews: some View {
        LoginView(email: $email, password: $password)
    }
}
#endif
