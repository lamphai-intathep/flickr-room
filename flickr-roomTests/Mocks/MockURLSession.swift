//
//  MockURLSession.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 10/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation
import XCTest

public extension URLSession {
    static var mock: URLSession {
        // attach some fixed data in protocol handler
        MockURLProtocol.testURLs = Bundle.fixtureForResponse
       
        // now set up a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        // and create the URLSession from that
        return URLSession(configuration: config)
    }
}

