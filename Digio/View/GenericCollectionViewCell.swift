//
//  GenericCollectionViewCell.swift
//  Digio
//
//  Created by Martha R on 16/11/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import Kingfisher
import UIKit

class GenericCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var contentImage: UIImageView!
    
    // MARK: - Methods
    func prepare(content: Content, type: ContentType, index: Int){
        switch type {
        case .cash:
            guard let imageURL = content.cash?.bannerURL else { return }
            let url = URL(string: imageURL)
            self.contentImage.kf.setImage(with: url)
            
        case .product:
            guard let imageURL = content.products?[index].imageURL else { return }
            let url = URL(string: imageURL)
            self.contentImage.kf.setImage(with: url)
            
        case .spotlight:
            guard let imageURL = content.spotlight?[index].bannerURL else { return }
            let url = URL(string: imageURL)
            self.contentImage.kf.setImage(with: url)
        }
    }
}
