//
//  Bundle+Fixture.swift
//  flickr-roomTests
//
//  Created by Lamphai Intathep on 10/9/20.
//  Copyright © 2020 Lamphai Intathep. All rights reserved.
//

import Foundation
import XCTest
@testable import flickr_room

extension Bundle {
    func fixture<T: Decodable>(_ type: T.Type) -> T {
        guard let bundlePath = Bundle.main.path(forResource: "\(type)", ofType: "json") else {
            fatalError()
        }
        print("type \(type)")
        
        guard let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) else {
            fatalError()
        }
        
        guard let resut = try? JSONDecoder().decode(T.self, from: jsonData) else {
            fatalError()
        }
        
        return resut
    }
    
    static var fixtureForResponse: [URL: Data] {
        guard let path = Bundle.main.path(forResource: "PhotoEnvelop", ofType: "json") else {
            fatalError()
        }
        
        guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8)  else {
            fatalError()
        }
        
        var fixtureContent = [URL: Data]()
        let component = URLComponents(url: URL.mockBaseURL, resolvingAgainstBaseURL: false)!
        fixtureContent[component.url!] = jsonData
        //print(">>>>>>>> fixtureForResponse fixturecontent:: \(fixtureContent)")
        return fixtureContent
    }
}
