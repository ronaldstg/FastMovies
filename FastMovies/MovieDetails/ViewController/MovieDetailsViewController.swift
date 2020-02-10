//
//  MovieDetailsViewController.swift
//  FastMovies
//
//  Created by Ronald on 09/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @objc class func newInstanceFromStoryboard() -> MovieDetailsViewController {
        let viewController = MovieDetailsViewController.instantiate(viewControllerOfType: MovieDetailsViewController.self, storyboardName: "MovieDetails")
        
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension MovieDetailsViewController {

    func bind() {

    }

}

extension UIViewController {
    class func instantiate<T>(viewControllerOfType type: T.Type, storyboardName: String) -> T {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "\(type)") as! T
    }
}
