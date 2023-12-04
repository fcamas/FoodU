//
//  HeaderView.swift
//  FoodU
//
//  Created by Fredy Camas on 12/3/23.
//


import UIKit

class HeaderView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addCustomConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomConstraints() {
    }
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = carouselCompositionalLayout()
        //let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        
        collectionView.backgroundColor = .white
        return collectionView
    }()
}

func carouselCompositionalLayout() -> UICollectionViewCompositionalLayout {
    let carouselLayout: UICollectionViewCompositionalLayout = {
        let itemFraction: CGFloat = 1.0 / 4.0
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemFraction), heightDimension: .fractionalWidth(itemFraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2.5, bottom: 0, trailing: 2.5)
        section.orthogonalScrollingBehavior = .continuous
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.7
                let maxScale: CGFloat = 0.7
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    return carouselLayout
}
