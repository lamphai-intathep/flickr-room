//
//  Photos.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 27/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation

struct PhotoModel: Codable {
    var photos: Photo
}

struct Total: Codable {
    var total: Int
}

struct PhotoModel: Codable {
    var id: String
    var farm: Int
    var server: String
    var secret: String
    var title: String
    
//    init(id: String, farm: Int, server: String, secret: String, title: String) {
//        self.id = id
//        self.farm = farm
//        self.server = server
//        self.secret = secret
//        self.title = title
//    }
    
}
