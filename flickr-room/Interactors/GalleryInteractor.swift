//
//  GalleryInteractor.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 27/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class GalleryInteractor {
    let client = FlickClient()
    
    // this will be called from GalleryVC to observe current state variable
    var stateTransitionHandler: ((State) -> Void)?
    
    // this get called/re-rendered everytime state is changed e.g. self.state = .loaded
    // call stateTransitionHanlder and pass in the current state
    var state: State! {
        didSet {
            self.stateTransitionHandler?(self.state)
            //print(state as Any)
        }
    }
    
    func start(searchText: String?) {
        state = .loading
        client.fetchPhotos(seachText: searchText, completion: {(photoEnvelop) in
            let presenter = GalleryPresenter(photoEnvelop: photoEnvelop)
            if presenter.isEmpty {
                self.state = .empty
            } else {
                self.state = .loaded(presenter: presenter)
            }
        })
    }
}
