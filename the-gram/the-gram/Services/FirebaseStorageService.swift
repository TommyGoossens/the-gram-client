//
//  FirebaseStorageService.swift
//  The Gram
//
//  Created by Tommy Goossens on 23/03/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import UIKit
import FirebaseStorage

struct FirebaseStorageService {
    
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?)-> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return completion(nil)
        }
        
        reference.putData(imageData,metadata: nil, completion: { (metadata,error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            reference.downloadURL(completion: {(url,error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion(nil)
                }
                completion(url)
            })
        })
    }
    
}
