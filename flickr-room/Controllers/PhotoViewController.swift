//
//  PhotoViewController.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 2/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = url {
            imageView.loadFromURL(url: url)
            //print("PhotoViewController: \(url)")
        }
    }
}
