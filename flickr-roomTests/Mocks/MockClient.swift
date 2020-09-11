//
//  MockClient.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation
@testable import flickr_room

extension FlickClient {
    static var mock = FlickClient(urlSession: URLSession.mock, baseURL: URL.mockBaseURL)
}
