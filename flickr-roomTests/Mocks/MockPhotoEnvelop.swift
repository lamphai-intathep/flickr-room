//
//  MockPhotoEnvelop.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation
@testable import flickr_room

extension Photos {
    static var mockPhotos: Photos { Bundle.main.fixture(Photos.self) }
}
