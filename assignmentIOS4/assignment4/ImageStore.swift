//
//  ImageStore.swift
//  assignment4
//
//  Created by Andy Olivares on 4/12/20.
//  Copyright © 2020 Andy Olivares. All rights reserved.
//

import Foundation
import UIKit

class ImageStore {
    
    let imageCache = NSCache<NSString, AnyObject>()
    
    func downloadImage(with urlString: String, completion: @escaping (_ image: UIImage?) ->Void) {
        
        if urlString == "None" {
            completion(UIImage(named: "default.png"))
        } else if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            completion(cachedImage)
        } else {
            
            weak var weakSelf = self
            
            if let url = URL(string: urlString) {
                
                let task = URLSession.shared.dataTask(with: url) {
                    (data, response, error) in
                    
                    let httpResponse = response as? HTTPURLResponse
                    
                    if httpResponse!.statusCode != 200 {
                        DispatchQueue.main.async {
                            print("HTTP error: status code \(httpResponse!.statusCode)")
                            completion(UIImage(named: "default.png"))
                        }
                    } else if (data == nil && error != nil) {
                        DispatchQueue.main.async {
                            print("No data downloaded")
                            completion(UIImage(named: "default.png"))
                        }
                    } else {
                        
                        if let image = UIImage(data: data!) {
                            DispatchQueue.main.async {
                                weakSelf!.imageCache.setObject(image, forKey: urlString as NSString)
                                completion(image)
                            }
                        } else {
                            DispatchQueue.main.async {
                                completion(UIImage(named: "default.png"))
                            }
                        }
                    }
                }
                
                task.resume()
            } else {
                completion(UIImage(named: "default.png"))
            }
        }
    }
    
    func clearCache() {
        weak var weakSelf = self
        DispatchQueue.main.async {
            weakSelf!.imageCache.removeAllObjects()
        }
    }
}
