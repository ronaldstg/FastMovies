//
//  MovieDetailsViewModel.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

class MovieDetailsViewModel {
    
    public var movie = PublishSubject<Movie>()
    
    public func request(selectedId: String) {

        APIManager.requestMovieById(id: selectedId, completion: { result in
            switch result {
            case .success(let value):
               let json = JSON(value)
               let decoder = JSONDecoder()
               
               
               let movie = try! decoder.decode(Movie.self, from: json.rawData())
               self.movie.onNext(movie)
               

            case .failure(let error):
                print(error)
            }
        })
    }
}
