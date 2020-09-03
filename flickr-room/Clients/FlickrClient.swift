//
//  GalleryClient.swift
//  flickr-room
//
//  Created by Lamphai Intathep on 31/8/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import UIKit

struct FlickClient {
    func fetchPhotos(seachText: String?, completion: @escaping (PhotoEnvelop) -> Void) {
        let url: URL!
        if let text = seachText, !text.isEmpty {
            let query: [String: String] = [
                "method": Constants.searchMethod,
                "api_key": Constants.api_key,
                "text": text,
                "format": "json",
                "nojsoncallback": "1"
            ]
            url = Constants.baseURL?.withQueries(query)
        } else {
            url = URL(string: Constants.defaultURL)
        }
        //print(url!)
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
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
            let decoder = JSONDecoder()
            let photoInfo = try decoder.decode(PhotoEnvelop.self, from: data)
            return photoInfo
        } catch {
            print("Parsing JSON failed: \(error)")
            return nil
        }
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
