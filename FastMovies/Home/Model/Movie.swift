//
//  Movie.swift
//  FastMovies
//
//  Created by Ronald on 06/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let id, original_title, poster_path, backdrop_path, overview: String

    enum CodingKeys: String, CodingKey {
        case id, original_title, poster_path, backdrop_path, overview
    }
}

extension Movie {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Movie.self, from: data) else { return nil }
        self = me
    }
    
   func asDictionary() throws -> [String: Any] {
     let data = try JSONEncoder().encode(self)
     guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
       throw NSError()
     }
     return dictionary
   }
}
