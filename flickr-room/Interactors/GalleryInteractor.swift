//
//  GalleryInteractor.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 27/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class GalleryInteractor { // adapt interactor to take any client
    let client: FlickClient
    
    typealias P = GalleryPresenter
    // this will be called from GalleryVC to observe current state variable
    var stateTransitionHandler: ((State<P>) -> Void)?
    
    // this get called/re-rendered everytime state is changed e.g. self.state = .loaded
    // call stateTransitionHanlder and pass in the current state
    var state: State<P> = .loading {
        didSet {
            DispatchQueue.main.async {
                self.stateTransitionHandler?(self.state)
            }
        }
    }
    
    init(client: FlickClient) { // inject FlickClient
        self.client = client
        state = .loading
    }
    
    func start(searchText: String?) {
        state = .loading
        client.fetchPhotos(seachText: searchText, completion: {(photoEnvelop) in
            let presenter = GalleryPresenter(photoEnvelop: photoEnvelop)
            //print("here \(photoEnvelop)")
            if presenter.isEmpty {
                self.state = .empty
            } else {
                self.state = .loaded(presenter)
            }
        })
    }
}
