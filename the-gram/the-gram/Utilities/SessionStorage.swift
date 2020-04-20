//
//  SessionStorage.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class SessionStorage: ObservableObject {
    var didChange = PassthroughSubject<SessionStorage, Never>()
    var isLoggedIn = false {didSet { self.didChange.send(self)}}
    @Published var session: User? { didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    init(session: User? = nil) {
        self.session = session
    }
    
    deinit {
        unbind()
    }
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener{(auth, user) in
            if let user = user {
                self.isLoggedIn = true
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
            
        }
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    typealias CompletionHandler = (_ token:String,_ useruid:String) -> Void
    static func getToken(completionHandler: @escaping CompletionHandler){
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(true){ idToken, error in
            if let error = error {
                print(error)
            }
            if let idToken = idToken{
                completionHandler(idToken,currentUser!.uid)
            }
        }
    }
    
    func signOut() -> Bool {
        do{
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
