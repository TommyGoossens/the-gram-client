//
//  RestService.swift
//  The Gram
//
//  Created by Tommy Goossens on 23/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire

class RestService {
    let api: String = "https://127.0.0.1:5001/api/"
    
    let manager = ServerTrustManager(evaluators: ["127.0.0.1": DisabledEvaluator()])
    let session: Session
    init() {
        session = Session(serverTrustManager: self.manager)
    }
    
    func getRequest(endpoint: String){
        let request = session.request(api+endpoint)
        request.responseData{
            (data) in
            print(data)
        }
    }
    
    func uploadImage(newPost: NewGramPost){
        var headers = HTTPHeaders()
        var parameters = [String:String]()
        let imgData = newPost.Image.jpegData(compressionQuality: 0.2)!
        
        SessionStorage.getToken() { (token,uid) in
            parameters = ["description":newPost.Description]
            headers.add(HTTPHeader.authorization(bearerToken: token))
            self.session.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "image", fileName: "\(uid).jpg", mimeType: "multipart/form-data")
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: "\(self.api)post/post", method: .post, headers: headers).response{(data) in print(data)}
        }
    }
    
    func postRequest(endpoint: String, body: Data){
        SessionStorage.getToken() { (token,uid) in
            print(token)
            print(uid)
            // let request = session.upload(body, to: api+endpoint)
        }
        
        
    }
}
