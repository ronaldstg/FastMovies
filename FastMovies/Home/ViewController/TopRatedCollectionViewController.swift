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

class TopRatedCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    
    public var homeViewModel:HomeViewModel!
    public var movies = PublishSubject<[Movie]>()
    private let disposeBag = DisposeBag()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        topRatedCollectionView.delegate = self
        bind()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 290)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

private extension TopRatedCollectionViewController {
        
    private func bind() {
        
        let dark_mode = Bundle.main.infoDictionary?["dark_mode"] as! String
        if (dark_mode == "YES") {
            topRatedCollectionView.register(UINib(nibName: "MoviesCollectionDarkViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: MoviesCollectionViewCell.self))
        } else {
            topRatedCollectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: MoviesCollectionViewCell.self))
        }
        
        movies.bind(to: topRatedCollectionView.rx.items(cellIdentifier: "MoviesCollectionViewCell", cellType: MoviesCollectionViewCell.self)) { (row, movie, cell) in
            cell.movie = movie
        }.disposed(by: disposeBag)
        
        topRatedCollectionView.rx.modelSelected(Movie.self)
        .subscribe(onNext: { [weak self] item in
            self?.homeViewModel.selectedMovie.onNext(item.id)
        }).disposed(by: disposeBag)
        
    }
}

