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

class HomeViewModel {
    
    public let topRatedMovies : PublishSubject<[Movie]> = PublishSubject()
    public let popularMovies : PublishSubject<[Movie]> = PublishSubject()
    public let selectedMovie: PublishSubject<String> = PublishSubject()
    
    public func request() {
    }
}
