//
//  HomeController.swift
//  FoodU
//
//  Created by Fredy Camas on 09/03/23.
//

import UIKit
import CoreLocation

class HomeController: UICollectionViewController {
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var isSearchBarVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeController: SearchResultCellDelegate {
    func togglHeartBtn(for cell: SearchResultCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        cardContainerOnDisplay[indexPath.row].favorite =
        !cardContainerOnDisplay[indexPath.row].favorite
        
        collectionView.reloadItems(at: [indexPath])
    }
}
