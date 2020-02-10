//
//  MovieDetailsViewController.swift
//  FastMovies
//
//  Created by Ronald on 09/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    var movieId:String!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var movieDetailsViewModel = MovieDetailsViewModel()
    let disposeBag = DisposeBag()
    
    @objc class func newInstanceFromStoryboard() -> MovieDetailsViewController {
        let viewController = MovieDetailsViewController.instantiate(viewControllerOfType: MovieDetailsViewController.self, storyboardName: "MovieDetails")
        
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL for backdrop image tests
        // https://image.tmdb.org/t/p/w500/5BwqwxMEjeFtdknRV792Svo0K1v.jpg
        bind()
        
        let movie = Movie(id: "1", original_title: "Ad Astra", poster_path: "/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg", backdrop_path: "/5BwqwxMEjeFtdknRV792Svo0K1v.jpg", overview: "Lorem Ipsum")
        movieDetailsViewModel.movie.onNext(movie)
    }
    
}

extension MovieDetailsViewController {

    func bind() {
        
        movieDetailsViewModel
            .movie
            .bind { (movie) in

                let backdropUrlString = "https://image.tmdb.org/t/p/w500" + movie.backdrop_path
                let posterUrlString = "https://image.tmdb.org/t/p/w500" + movie.poster_path
                
                Alamofire.request(backdropUrlString).responseImage { response in
                    if let image = response.result.value {
                        self.backdropImageView.image = image
                       
                    }
                }
                
                Alamofire.request(posterUrlString).responseImage { response in
                    if let image = response.result.value {
                        self.posterImageView.image = image
                    }
                }
                
                self.movieTitleLabel.text = movie.original_title
                
                
        }.disposed(by: disposeBag)
        
    }

}

extension UIViewController {
    class func instantiate<T>(viewControllerOfType type: T.Type, storyboardName: String) -> T {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "\(type)") as! T
    }
}
