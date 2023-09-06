//
//  FavController.swift
//  FoodU
//
//  Created by Fredy Camas on 09/03/23.
//

import UIKit
class FavController: UICollectionViewController{
    
    init() {
       let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.badgeValue = "2"
    }
}
