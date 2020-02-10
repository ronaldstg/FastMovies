//
//  APIManager.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    enum ApiResult {
        case success(JSON)
        case failure(Error)
    }
    
    static func requestTopRated(completion: @escaping (ApiResult) -> Void) {
        Alamofire.request(TheMovieDBRouter.top_rated).responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(ApiResult.success(json))
                case .failure(let error):
                    print(error)
                    completion(ApiResult.failure(error))
            }
        }
    }
    
    static func requestPopular(completion: @escaping (ApiResult) -> Void) {
        Alamofire.request(TheMovieDBRouter.popular).responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(ApiResult.success(json))
                case .failure(let error):
                    print(error)
                    completion(ApiResult.failure(error))
            }
        }
    }
    
    static func requestMovieById(id:String, completion: @escaping (ApiResult) -> Void) {
        Alamofire.request(TheMovieDBRouter.details(id)).responseJSON { response in
               switch response.result {
                   case .success(let value):
                       let json = JSON(value)
                       completion(ApiResult.success(json))
                   case .failure(let error):
                       print(error)
                       completion(ApiResult.failure(error))
               }
           }
       }
}
