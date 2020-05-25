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
    
    
    static func GetImage(mediaURL : String) -> UIImage {
        if mediaURL == "" {
            return UIImage(named: "appicon")!
        }
        let url: URL = URL(string: mediaURL)!
        guard let imageData = try? Data(contentsOf: url) else{
            return UIImage(named: "appicon")!
        }
        return UIImage(data: imageData)!
    }
}
