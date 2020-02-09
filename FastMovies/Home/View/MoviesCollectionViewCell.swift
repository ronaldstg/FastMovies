//
//  MoviesCollectionViewCell.swift
//  FastMovies
//
//  Created by Ronald on 04/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class MoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overview: UILabel!
    
    
    public var movie:Movie! {
        didSet {
            
            let posterUrlString = "https://image.tmdb.org/t/p/w500" + movie.poster_path
            
            Alamofire.request(posterUrlString).responseImage { response in
                if let image = response.result.value {
                    self.posterImageView.image = image
                }
            }
            
            self.titleLabel.text = movie.original_title
            self.overview.text = movie.overview
        }
    }
    
    override func prepareForReuse() {
        //
    }
    
}
