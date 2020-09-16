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
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterLabel: UILabel!
    
    // MARK: - Override Func
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Functions
    func configure(with imageUrl: URL, name: String) {
        characterImageView.af.setImage(withURL: imageUrl)
        characterLabel.text = name
    }
    
    static func nib() -> UINib {
        return UINib(nibName: AppConstant.identifier, bundle: nil )
    }
}
