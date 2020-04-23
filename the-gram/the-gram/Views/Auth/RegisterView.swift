//
//  RegisterView.swift
//  the-gram
//
//  Created by Tommy Goossens on 11/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import UIKit
import FirebaseAuth

struct RegisterView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    
    var body: some View {
        VStack {
            TextField("Email", text: self.$email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
            SecureField("Password", text: self.$password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Confirm password", text: self.$confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    @State static var email = "tommygoossens@ziggo.nl"
    @State static var password = "123456"
    @State static var confirmPassword = "123456"
    static var previews: some View {
        RegisterView(email: $email, password: $password, confirmPassword:$confirmPassword)
    }
}
#endif
