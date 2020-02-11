//
//  Genre.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation

struct Genre: Codable {
    
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

extension Genre {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Genre.self, from: data) else { return nil }
        self = me
    }
}
