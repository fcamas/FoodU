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
