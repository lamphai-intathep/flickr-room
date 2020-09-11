//
//  GalleryPresenter.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 28/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class GalleryPresenter {
    var photoEnvelop: PhotoEnvelop
    
    init(photoEnvelop: PhotoEnvelop) {
        self.photoEnvelop = photoEnvelop
    }
    
    var isEmpty: Bool { photoEnvelop.photos.photo.isEmpty }
    var numberOfPhotos: Int { photoEnvelop.photos.photo.count }
    
    subscript(index: Int) -> PhotoPresenter { PhotoPresenter(photo: photoEnvelop.photos.photo[index]) }
}
