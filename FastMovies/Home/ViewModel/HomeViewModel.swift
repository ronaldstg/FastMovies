//
//  HomeViewModel.swift
//  FastMovies
//
//  Created by Ronald on 04/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

class HomeViewModel {
    
    public let topRatedMovies : PublishSubject<[Movie]> = PublishSubject()
    public let popularMovies : PublishSubject<[Movie]> = PublishSubject()
    public let genresList : PublishSubject<[Genre]> = PublishSubject()
    public let selectedMovie: PublishSubject<Int> = PublishSubject()
    
    public func request() {
        
        APIManager.requestTopRated { result in
            switch result {
            case .success(let value):
               let json = JSON(value)
             
               let movies = json["results"].arrayValue.compactMap {return Movie(data: try! $0.rawData())}
               self.topRatedMovies.onNext(movies)
               debugPrint(movies)
                
            case .failure(let error):
                print(error)
            }
        }
        
        APIManager.requestPopular { result in
            switch result {
            case .success(let value):
               let json = JSON(value)
             
               let movies = json["results"].arrayValue.compactMap {return Movie(data: try! $0.rawData())}
               self.popularMovies.onNext(movies)
               debugPrint(movies)
                
            case .failure(let error):
                print(error)
            }
        }
        
        APIManager.requestGenresList { result in
            switch result {
            case .success(let value):
               let json = JSON(value)

               let genres = json["genres"].arrayValue.compactMap {return Genre(data: try! $0.rawData())}
               self.genresList.onNext(genres)
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
