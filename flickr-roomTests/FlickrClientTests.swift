//
//  FlickrClientTests.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import XCTest
@testable import flickr_room

class FlickrClientTests: XCTestCase {
    let client = FlickClient.mock
    
    func testfetchPhotos() {
        let expectation = XCTestExpectation(description: "Test FetchPhotos")
        client.fetchPhotos(seachText: nil) { (result) in
            let photos = result.photos.photo
            if !photos.isEmpty {
                XCTAssert(photos.count == 4)
                XCTAssert(result.photos.photo.first!.title == "Australia")
                XCTAssert(result.photos.photo.last!.title == "Great Ocean Road")
                expectation.fulfill()
                print(">>>>>>>>>> testfetchPhotos \(result.photos)")
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
