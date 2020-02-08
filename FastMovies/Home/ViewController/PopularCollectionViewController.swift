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

    }
    
}

private extension PopularCollectionViewController {
        
    // TODO: bind collectionView and display cells
    private func bind() {
        
    }

}
