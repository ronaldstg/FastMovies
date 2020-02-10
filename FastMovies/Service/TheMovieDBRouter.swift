//
//  TheMovieDBRouter.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation
import Alamofire

public enum TheMovieDBRouter {
    
    static let baseURLPath = "https://api.themoviedb.org/3"
    static let apiKey = "fccc5aaa5f2a4de59d2660df19c7f628"
    
    case latest
    case popular
    
    var path: String {
      switch self {
      case .latest:
        return "/movie/latest"
      case .popular:
        return "/movie/popular"
      }
    }
    
    var parameters: [String: Any] {
      switch self {
      case .popular:
        return ["api_key":TheMovieDBRouter.apiKey]
      default:
        return ["api_key":TheMovieDBRouter.apiKey]
      }
    }
   
}
