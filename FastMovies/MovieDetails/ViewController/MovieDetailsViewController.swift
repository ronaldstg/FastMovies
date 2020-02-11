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
    
    var movieId:Int!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movieDetailsViewModel = MovieDetailsViewModel()
    let disposeBag = DisposeBag()
    
    @objc class func newInstanceFromStoryboard() -> MovieDetailsViewController {
        let viewController = MovieDetailsViewController.instantiate(viewControllerOfType: MovieDetailsViewController.self, storyboardName: "MovieDetails")
        
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        movieDetailsViewModel.request(selectedId: String(movieId))
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
                self.overviewLabel.text = movie.overview
        }.disposed(by: disposeBag)
        
        movieDetailsViewModel
            .loading
            .bind { (status) in
                if (status) {
                    self.showLoading(onView: self.view)
                } else {
                    self.removeLoading()
                }
        }.disposed(by: disposeBag)
    }
}

extension UIViewController {
    class func instantiate<T>(viewControllerOfType type: T.Type, storyboardName: String) -> T {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "\(type)") as! T
    }
}
