//
//  PhotoClient.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 2/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

struct PhotoClient {
    func loadPhoto(photoPresenter: PhotoPresenter, completion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: photoPresenter.url) { (data, respponse, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("Loading image failed: \(String(describing: error))")
                    return
                }
                
                if let data = data {
                    if let image = UIImage(data: data) {
                        completion(image)
                    }
                }
            }
        }.resume()
    }
}
