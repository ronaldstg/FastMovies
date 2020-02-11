//
//  TheMovieDBRouter.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation
import Alamofire

public enum TheMovieDBRouter: URLRequestConvertible {
    
    static let baseURLPath = "https://api.themoviedb.org/3"
    static let apiKey = "fccc5aaa5f2a4de59d2660df19c7f628"
    
    case latest
    case top_rated
    case popular
    case genresList
    case details(String)
    
    var method: HTTPMethod {
      switch self {
      case .latest,.top_rated, .popular, .genresList, .details:
        return .get
      }
    }
    
    var path: String {
      switch self {
      case .latest:
        return "/movie/latest"
      case .top_rated:
        return "/movie/top_rated"
      case .popular:
        return "/movie/popular"
      case .genresList:
        return "/genre/movie/list"
      case .details(let movieId):
        return "/movie/\(movieId)"
      }
    }
    
    var parameters: [String: Any] {
      switch self {
      case .latest, .popular:
        return ["api_key":TheMovieDBRouter.apiKey]
      default:
        return ["api_key":TheMovieDBRouter.apiKey]
      }
    }
   
    public func asURLRequest() throws -> URLRequest {

      let url = try TheMovieDBRouter.baseURLPath.asURL()
      var request = URLRequest(url: url.appendingPathComponent(path))
      
      request.httpMethod = method.rawValue
      request.setValue(TheMovieDBRouter.apiKey, forHTTPHeaderField: "Authorization")
      request.timeoutInterval = TimeInterval(10 * 1000)
      
      return try URLEncoding.default.encode(request, with: parameters)
      
    }
    
}
