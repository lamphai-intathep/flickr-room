//
//  Photo.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 7/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
}
