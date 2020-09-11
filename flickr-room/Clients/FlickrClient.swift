//
//  GalleryClient.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 31/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

class FlickClient { // use any URLSession not the one created in here, so inject in
    let urlSession: URLSession
    let baseURL: URL

    init(urlSession: URLSession, baseURL: URL) {
        self.urlSession = urlSession
        self.baseURL = baseURL
    }
    
    func fetchPhotos(seachText: String?, completion: @escaping (PhotoEnvelop) -> Void) {
        let url: URL!
        
        if let text = seachText, !text.isEmpty {
            let query: [String: String] = [
                "method": "flickr.photos.search",
                "api_key": FlickClient.api_key,
                "text": text,
                "format": "json",
                "nojsoncallback": "1"
            ]
            url = self.baseURL.withQueries(query)
        } else {
            let query: [String: String] = [
                "method": "flickr.galleries.getPhotos",
                "api_key": FlickClient.api_key,
                "gallery_id": "72157712273183531",
                "format": "json",
                "nojsoncallback": "1"
            ]
            url = self.baseURL.withQueries(query)
        }
        //print(">>>>>>> real url: \(url!)")
    
        if let url = url {
            urlSession.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if error != nil {
                        print("Loading photo failed: \(String(describing: error))")
                        return
                    }

                    if let data = data {
                        if let response = self.parseJSON(data: data) {
                            completion(response)
                            //print(response)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func parseJSON(data: Data) -> PhotoEnvelop? {
        do {
            print("parseJSON: \(data)")
            let decoder = JSONDecoder()
            let photoInfo = try decoder.decode(PhotoEnvelop.self, from: data)
            //print(photoInfo)
            return photoInfo
        } catch let e {
            print("Parsing JSON failed: \(e)")
            return nil
        }
    }
}

extension FlickClient {
    static let api_key = "9cb35f2e97740dd5da38acab2c6aa9ca"
    static let baseURL = URL(string: "https://www.flickr.com/services/rest/")!
    static let defaultURL = "https://www.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=9cb35f2e97740dd5da38acab2c6aa9ca&gallery_id=72157712273183531&format=json&nojsoncallback=1"
    static let searchMethod = "flickr.photos.search"
}
