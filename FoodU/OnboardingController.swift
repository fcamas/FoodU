//
//  Onboarding.swift
//  FoodU
//
//  Created by Fredy Camas on 09/15/23.
//

import UIKit
import CoreLocation
class OnBoardingController: UIViewController {
    let vc = TabBarView()
    
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    private var keyboardHeight: CGFloat = 0
    private let blurEffect = UIBlurEffect(style: .dark)
    private let blurView = UIVisualEffectView()
    var longitud:CLLocationDegrees?
    var latitud:CLLocationDegrees?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
