//
//  AuthenticationView.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var session: SessionStorage
    
    @State var isSignIn: Bool = true
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack{
            KeyboardHost{
                Group {
                    Text("The Gram")
                        .font(.largeTitle)
                    Image("appicon")
                    Text(isSignIn ? "Sign In" : "Register")
                        .font(.headline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                }
                
                if isSignIn {
                    LoginView(email: $email, password: $password)
                }else {
                    RegisterView(email: $email, password: $password, confirmPassword: $confirmPassword)
                }
                
                HStack {
                    Button(action: switchViews) {
                        Text(isSignIn ? "Register" : "Cancel")
                    }.buttonStyle(PrimitiveButton(isCancelButton: false))
                    Spacer()
                    Button(action:confirmAction) {
                        Text(isSignIn ? "Sign In" : "Register")
                    }.buttonStyle(PrimitiveButton(isCancelButton: false))
                }
                .padding(.top)
            }
        }
        .padding(.horizontal, 20.0)
    }
    
    /*
        Switches between the login and register views
     */
    func switchViews(){
        isSignIn = !isSignIn
        email = ""
        password = ""
        confirmPassword = ""
    }
    
    /*
        Depending on the view: signs the user in, or registers an account
     */
    func confirmAction(){
        isSignIn ? signIn() : signUp()
    }
    
    /*
        Registers the user
     */
    func signUp() {
        if !email.isEmpty && !password.isEmpty && password == confirmPassword {
            session.signUp(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }
    
    /*
        Signs the user in
     */
    func signIn() {
        if(!email.isEmpty && !password.isEmpty){
            session.signIn(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }
}

#if DEBUG
struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
#endif
