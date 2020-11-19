//
//  ContentTableViewCell.swift
//  Digio
//
//  Created by Martha R on 16/11/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//
import Kingfisher
import UIKit

class ContentTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    var content: Content!
    var type: ContentType!
    
    // MARK: - Methods
    func prepare(contents: Content, type: ContentType) {
        self.content = contents
        self.type = type
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "GenericCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: "collectionViewCell")
    }
}

extension ContentTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch type {
        case .product:
            return content.products?.count ?? 1
        case .spotlight:
            return content.spotlight?.count ?? 1
        default: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let content = content, let type = type {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell",
                                                             for: indexPath) as? GenericCollectionViewCell {
                cell.prepare(content: content, type: type, index: indexPath.row)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch type {
        case .product:
            return CGSize(width: 80, height: 80)
        case .cash:
            return CGSize(width: 375, height: 100)
        default:
            return CGSize(width: 300, height: 160)
        }
    }
}
