//
//  Constant.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 3/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//
import UIKit

struct Constants {
    // property type
    static let showPhoto = "showPhoto"
    static let imageCell = "imageCell"
    
    static let searchMethod = "flickr.photos.search"
    static let api_key = "9cb35f2e97740dd5da38acab2c6aa9ca"
    static let baseURL = URL(string: "https://www.flickr.com/services/rest/")
    static let defaultURL = "https://www.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=9cb35f2e97740dd5da38acab2c6aa9ca&gallery_id=72157712273183531&format=json&nojsoncallback=1"
}
