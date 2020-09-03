//
//  UIImageView+Load.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 3/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//
import UIKit

//Extensions allow you to add functionality to a type that's already defined.
extension UIImageView {
    func loadFromURL(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, respponse, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("Loading image failed: \(String(describing: error))")
                    return
                }
                
                if let data = data {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }
                }
            }
        }.resume()
    }
}
