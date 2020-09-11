//
//  GalleryInteractorTests.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import XCTest
import UIKit

@testable import flickr_room

class GalleryInteractorTests: XCTestCase {
    let client = FlickClient.mock
    
    func testStateCompleted() {
        let interactor = GalleryInteractor(client: client)
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2
        
        interactor.stateTransitionHandler = { state in
            switch state {
            case .loading:
                //XCTFail("Should not be empty")
                expectation.fulfill()
            case .loaded(presenter: _):
                expectation.fulfill()
            case .empty:
                XCTFail("Should not be empty")
                //expectation.fulfill()
            case .error(_):
                XCTFail("Error")
            }
        }
        
        interactor.start(searchText: nil)
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testdefaultStateLoading() {
        let interactor = GalleryInteractor(client: client)
         switch interactor.state {
            case .loaded:
                XCTFail("Should be .loading")
            case .empty:
                XCTFail("Should be .loading")
            case .error:
                XCTFail("Should be .loading")
            case .loading:
                break
        }
     }
}
