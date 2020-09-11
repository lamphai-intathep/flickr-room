//
//  GalleryPresenterTests.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import XCTest
import Foundation
@testable import flickr_room // activate access to module

class GalleryPresenterTests: XCTestCase {
    func testRowCount() {
        let photoEnvelop = PhotoEnvelop(photos: Photos.mockPhotos)
        let presenter = GalleryPresenter(photoEnvelop: photoEnvelop)
        XCTAssert(presenter.numberOfPhotos == 3)
    }
    
    func testPresenterIsNotEmpty() {
        let photoEnvelop = PhotoEnvelop(photos: Photos.mockPhotos)
        let presenter = GalleryPresenter(photoEnvelop: photoEnvelop)
        //print(presenter)
        XCTAssertFalse(presenter.isEmpty)
    }
}
