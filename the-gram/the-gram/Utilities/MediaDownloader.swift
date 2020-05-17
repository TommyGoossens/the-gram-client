//
//  MediaDownloader.swift
//  The Gram
//
//  Created by Tommy Goossens on 14/05/2020.
//  Copyright © 2020 Tommy Goossens. All rights reserved.
//

import Foundation
import UIKit
struct MediaDownloader {
    
    private static func stringToURL(string: String) -> URL {
        guard let url = URL(string: string) else {
            return URL(string: "https://autototaalbv.nl/wp-content/uploads/2017/04/profile-placeholder.png")!
        }
        return url
    }
    
   static func GetImage(mediaURL : String) -> UIImage {
        let url: URL = stringToURL(string: mediaURL)
        let imageData = try? Data(contentsOf: url)
        return UIImage(data: imageData!)!
    }
}
