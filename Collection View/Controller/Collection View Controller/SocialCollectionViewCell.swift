//
//  SocialCollectionViewCell.swift
//  Collection View
//
//  Created by Fahim Rahman on 26/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class SocialCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var socialImage: UIImageView!
    @IBOutlet weak var socialLabel: UILabel!
    
    public func configure( model: HomeModel) {
        socialImage.image = model.socialImages
        socialLabel.text = model.socialLabels
    }
}
