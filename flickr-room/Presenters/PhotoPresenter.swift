//
//  PhotoPresenter.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 2/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class PhotoPresenter {
    var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var title: String { photo.title }
    var cellURL: URL { URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_z.jpg")!
    }
    var largeImageURL: URL {
        URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_b.jpg")!
    }
}
