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

class MovieDetailsViewModel {
    
    public var movie = PublishSubject<Movie>()
    
    public func request() {
        
    }
}
