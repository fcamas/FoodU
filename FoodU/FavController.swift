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
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveFavoritesUpdate), name: Notification.Name("BadgeValue"), object: nil)
        
    }
    // Handle the notification
    @objc private func didReceiveFavoritesUpdate() {
        updateBadgeValue()
    }
    func updateBadgeValue() {
        let cardIDArray = [2,3,4] // add badget db values here 
        tabBarItem.badgeValue = String(cardIDArray.count)
    }
}
