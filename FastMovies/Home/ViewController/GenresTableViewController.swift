//
//  GenresTableViewController.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class GenresTableViewController: UIViewController , UITableViewDelegate{
    
    @IBOutlet private weak var genresTableView: UITableView!
    
    public var homeViewModel:HomeViewModel!
    public var genres = PublishSubject<[Genre]>()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genresTableView.delegate = self
        bind()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

private extension GenresTableViewController {

    private func bind() {
        
        genresTableView.register(UINib(nibName: "GenresTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: GenresTableViewCell.self))
        
        genres.bind(to: genresTableView.rx.items(cellIdentifier: "GenresTableViewCell", cellType: GenresTableViewCell.self)) {  (row,genre,cell) in
            cell.genre = genre
        }.disposed(by: disposeBag)
        
    }

}
