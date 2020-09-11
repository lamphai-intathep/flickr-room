//
//  PhotoPresenterTests.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import XCTest
@testable import flickr_room

class PhotoPresenterTests: XCTestCase {
    func testCellURLs() {
        let photoEnvelop = PhotoEnvelop(photos: Photos.mockPhotos)
        print("test \(photoEnvelop)")
        for photo in photoEnvelop.photos.photo {
            let presenter = PhotoPresenter(photo: photo)
            XCTAssert(presenter.cellURL == URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_z.jpg"))
        }
    }
    
    func testLargeImageURLs() {
        let photoEnvelop = PhotoEnvelop(photos: Photos.mockPhotos)
        
        for photo in photoEnvelop.photos.photo {
            let presenter = PhotoPresenter(photo: photo)
            XCTAssert(presenter.largeImageURL == URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_b.jpg"))
        }
    }
}
