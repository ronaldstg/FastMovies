//
//  HomeViewController.swift
//  FastMovies
//
//  Created by Ronald on 04/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet weak var topRatedMoviesView: UIView!
    @IBOutlet weak var popularMoviesView: UIView!
    @IBOutlet weak var quickLinksView: UIView!
    
    private lazy var topRatedCollectionViewController: TopRatedCollectionViewController = {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "TopRatedCollectionViewController") as! TopRatedCollectionViewController
        
        viewController.homeViewModel = self.homeViewModel
        
        self.add(asChildViewController: viewController, to: topRatedMoviesView)
        
        return viewController
    }()
    
    private lazy var popularMoviesCollectionViewController: PopularCollectionViewController = {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
               
       var viewController = storyboard.instantiateViewController(withIdentifier: "PopularCollectionViewController") as! PopularCollectionViewController
       
       viewController.homeViewModel = self.homeViewModel
        
       self.add(asChildViewController: viewController, to: popularMoviesView)
       
       return viewController
    }()
    
    private lazy var genresTableViewController: GenresTableViewController = {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
               
       var viewController = storyboard.instantiateViewController(withIdentifier: "GenresTableViewController") as! GenresTableViewController
       
       viewController.homeViewModel = self.homeViewModel
        
       self.add(asChildViewController: viewController, to: quickLinksView)
       
       return viewController
    }()
    
    var homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dark_mode = Bundle.main.infoDictionary?["dark_mode"] as! String
        if (dark_mode == "YES") {
            overrideUserInterfaceStyle = .dark
        }
        
        bind()
        homeViewModel.request()
    }
}

extension HomeViewController {
    
    func bind() {
        
        homeViewModel
            .topRatedMovies
            .observeOn(MainScheduler.instance)
            .bind(to: topRatedCollectionViewController.movies)
            .disposed(by: disposeBag)
        
        homeViewModel
            .popularMovies
            .observeOn(MainScheduler.instance)
            .bind(to: popularMoviesCollectionViewController.movies)
            .disposed(by: disposeBag)
        
        homeViewModel
            .selectedMovie
            .bind { (movieId) in
                let controller = MovieDetailsViewController.newInstanceFromStoryboard()
                controller.movieId = movieId
                self.navigationController?.pushViewController(controller, animated: true)
        }.disposed(by: disposeBag)
        
        homeViewModel
            .genresList
            .observeOn(MainScheduler.instance)
            .bind(to: genresTableViewController.genres)
            .disposed(by: disposeBag)
        
        homeViewModel
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
    public func add(asChildViewController viewController: UIViewController,to parentView:UIView) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        parentView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = parentView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    public func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
}
