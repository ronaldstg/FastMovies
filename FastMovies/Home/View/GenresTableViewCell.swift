//
//  GenresTableViewCell.swift
//  FastMovies
//
//  Created by Ronald on 10/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import UIKit

class GenresTableViewCell: UITableViewCell {

    @IBOutlet weak var genreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public var genre:Genre! {
        didSet {
            self.genreButton.setTitle(genre.name, for: .normal)
        }
    }
}
