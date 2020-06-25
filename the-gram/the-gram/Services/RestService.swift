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
    private let api: String = "http://35.195.150.50/api/"
    
    let manager = ServerTrustManager(evaluators: ["the-gram.com": DisabledEvaluator(), "35.195.150.50":DisabledEvaluator()])
    let session: Session
    init() {
        session = Session(serverTrustManager: self.manager)
    }
    
    
    func getRequest<T: Decodable>(endpoint: String, of:T.Type ,dataReceived: @escaping(T)-> Void ){
        SessionStorage.getToken(){(token,uid) in
            var headers = HTTPHeaders()
            headers.add(HTTPHeader.authorization(bearerToken: token))
            self.session.request("\(self.api)\(endpoint)", method: .get,headers: headers).validate().responseData{(response) in
                switch response.result{
                case.failure(let error):
                    print(error)
                    
                case .success(let data):
                    do{
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        let parsed = try decoder.decode(T.self, from: data)
                        dataReceived(parsed)
                    }catch let error{
                        print(error)
                    }
                }
            }
        }
    }
    
    func uploadImage(newPost: NewGramPost, success: @escaping (Bool) -> Void){
        var headers = HTTPHeaders()
        var parameters = [String:String]()
        let imgData = newPost.Image.jpegData(compressionQuality: 0.2)!
        
        SessionStorage.getToken(){ (token,uid) in
            parameters = ["description":newPost.Description]
            headers.add(HTTPHeader.authorization(bearerToken: token))
            self.session.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "image", fileName: "\(uid).jpg", mimeType: "multipart/form-data")
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: "\(self.api)post/post", method: .post, headers: headers).response{(data) in
                if data.response?.statusCode == 201 {
                    success(true)
                } else{
                    success(false)
                }
            }
        }
    }
    
    func postRequest<T: Decodable>(endpoint: String, body: [String:AnyObject], of:T.Type ,dataReceived: @escaping(T)-> Void ){
        SessionStorage.getToken(){(token,uid) in
            var headers = HTTPHeaders()
            headers.add(HTTPHeader.authorization(bearerToken: token))
            
            self.session.request("\(self.api)\(endpoint)", method: .post, parameters:body,encoding:JSONEncoding.default, headers: headers).validate().responseData{(response) in
                switch response.result{
                case.failure(let error):
                    print(error)
                    
                case .success(let data):
                    do{
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        let parsed = try decoder.decode(T.self, from: data)
                        dataReceived(parsed)
                    }catch let error{
                        print(error)
                    }
                }
            }
        }
    }
    
    func putRequest<T: Decodable>(endpoint: String, body: [String:AnyObject], of:T.Type ,dataReceived: @escaping(T)-> Void ){
        SessionStorage.getToken(){(token,uid) in
            var headers = HTTPHeaders()
            headers.add(HTTPHeader.authorization(bearerToken: token))
            
            self.session.request("\(self.api)\(endpoint)", method: .put, parameters:body,encoding:JSONEncoding.default, headers: headers).validate().responseData{(response) in
                switch response.result{
                case.failure(let error):
                    print(error)
                    
                case .success(let data):
                    do{
                        let decoder = JSONDecoder()
                        let parsed = try decoder.decode(T.self, from: data)
                        dataReceived(parsed)
                    }catch let error{
                        print(error)
                    }
                }
            }
        }
    }
    
}
