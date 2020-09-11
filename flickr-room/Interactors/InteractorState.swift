//
//  ViewState.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 31/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation

//enum State {
//    case loading
//    case loaded(presenter: GalleryPresenter)
//    case empty
//    case error(Error)
//}

enum State<P: GalleryPresenter> {
    case loading
    case loaded(P)
    case empty
    case error(Error)
}
