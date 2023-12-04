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
        let viewLayout = //TODO Layout Here
        //let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        
        collectionView.backgroundColor = .white
        return collectionView
    }()
}
