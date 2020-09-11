//
//  ImageViewCell.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 1/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class ImageViewCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
}

extension ImageViewCell {
    static let identifier = "imageCell"
}
