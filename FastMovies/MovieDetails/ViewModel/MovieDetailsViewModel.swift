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
    public let loading: PublishSubject<Bool> = PublishSubject()
    
    public func request(selectedId: String) {
        
        self.loading.onNext(true)
        
        APIManager.requestMovieById(id: selectedId, completion: { result in
            self.loading.onNext(false)
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
