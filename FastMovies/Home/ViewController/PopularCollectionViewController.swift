//
//  PopularCollectionViewController.swift
//  FastMovies
//
//  Created by Ronald on 06/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class PopularCollectionViewController: UIViewController {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    public var movies = PublishSubject<[Movie]>()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
}

private extension PopularCollectionViewController {
        
    private func bind() {
        
        popularCollectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: MoviesCollectionViewCell.self))
        
        movies.bind(to: popularCollectionView.rx.items(cellIdentifier: "MoviesCollectionViewCell", cellType: MoviesCollectionViewCell.self)) { (row, movie, cell) in
            cell.movie = movie
        }.disposed(by: disposeBag)
        
    }

}
