//
//  ViewController.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 27/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchTexts: String?
    var selectedPhotoURL: URL?
    var galleryPresenter: GalleryPresenter!
    var galleryInteractor: GalleryInteractor! {
        didSet {
            galleryInteractor.stateTransitionHandler = { [weak self] state in
                guard let self = self else { return }
                switch state {
                case .loading:
                    print("Loading")
                case let .loaded(galleryPresenter):
                    self.galleryPresenter = galleryPresenter
                    self.updateUI()
                    print("Loaded")
                case .empty:
                    print("Empty")
                case .error(_):
                    print("Error")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(ImageViewCell.self, forCellReuseIdentifier: ImageViewCell.identifier)
        searchBar.delegate = self
        start()
    }
    
    func start() {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache.shared

        let urlSession = URLSession(configuration: configuration)
        let client = FlickClient(urlSession: urlSession, baseURL: FlickClient.baseURL)

        galleryInteractor = GalleryInteractor(client: client) // inject client here
        galleryInteractor.start(searchText: searchTexts?.lowercased())
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            let destination = segue.destination as! PhotoViewController
            if let url = selectedPhotoURL {
                destination.url = url
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            searchTexts = searchText
            start()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //print("searchText: \(searchBar.text!)")
        searchTexts = searchBar.text
        start()
    }
}

extension GalleryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        galleryPresenter?.numberOfPhotos ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewCell.identifier) as! ImageViewCell
        let photoPresenter = galleryPresenter?[indexPath.row]
        //print("test \(String(describing: photoPresenter?.cellURL))")
        cell.photoView.loadFromURL(url: photoPresenter!.cellURL)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPhotoURL = galleryPresenter[indexPath.row].largeImageURL
        //print("1 \(String(describing: selectedPhotoURL))")
        performSegue(withIdentifier: "showPhoto", sender: self)
    }
}
