//
//  MainCollectionViewCell.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 15.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet var characterImageView: UIImageView!

    // MARK: - Override Func
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Functions
    func configure(with image: UIImage) {
        characterImageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: AppConstant.identifier, bundle: nil )
    }
}
