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
    
    var topRatedCollectionViewController: TopRatedCollectionViewController!
    var popularMoviesCollectionViewController: PopularCollectionViewController!
    
    var homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension HomeViewController {
    
    func bind() {
        
    }
}
