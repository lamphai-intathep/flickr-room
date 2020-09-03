//
//  Photos.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 27/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation

struct PhotoEnvelop: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let photo: [Photo]
}

struct Photo: Codable {
    let id: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
}
