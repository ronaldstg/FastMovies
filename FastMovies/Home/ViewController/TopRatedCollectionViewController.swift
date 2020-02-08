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

    }
    
    
}

private extension TopRatedCollectionViewController {
        
    // TODO: bind collectionView and display cells
    private func bind() {
        
    }

}

