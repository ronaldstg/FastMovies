//
//  TopRatedCollectionViewController.swift
//  FastMovies
//
//  Created by Ronald on 04/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TopRatedCollectionViewController: UIViewController {

    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    
    public var movies = PublishSubject<[Movie]>()
    private let disposeBag = DisposeBag()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    
}

private extension TopRatedCollectionViewController {
        
    private func bind() {
        
        topRatedCollectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: MoviesCollectionViewCell.self))
        
        movies.bind(to: topRatedCollectionView.rx.items(cellIdentifier: "MoviesCollectionViewCell", cellType: MoviesCollectionViewCell.self)) { (row, movie, cell) in
            cell.movie = movie
        }.disposed(by: disposeBag)
    }
}

