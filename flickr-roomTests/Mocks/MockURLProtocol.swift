//
//  URLProtocolMock.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 10/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

// https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way

class MockURLProtocol: URLProtocol {

    static var testURLs = [URL?: Data]()

    // say we want to handle all types of request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    // ignore this method; just send back what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        // if we have a valid URL…
        if let url = request.url {
            
            var component = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            component.query = nil
            let url = component.url!
            
            // …and if we have test data for that URL…
            if let data = MockURLProtocol.testURLs[url] {
                // …load it immediately.
                client?.urlProtocol(self, didLoad: data)
            }
        }

        // mark that we've finished
        client?.urlProtocolDidFinishLoading(self)
    }

    // this method is required but doesn't need to do anything
    override func stopLoading() { }
}
