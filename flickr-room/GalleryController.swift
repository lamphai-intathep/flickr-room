//
//  ViewController.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 27/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    //@IBOutlet weak var imageCell: UICollectionViewCell!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let interactor = GalleryInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.performRequest(completion: { (photo) in
            //print(photo)
        })
        
        //collectionView.delegate = self
        collectionView.dataSource = self
        //view.addSubview(collectionView)
        collectionView.backgroundColor = .green
        print(collectionView.frame.width)
        print(collectionView.frame.width / 2)
    }

}

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

