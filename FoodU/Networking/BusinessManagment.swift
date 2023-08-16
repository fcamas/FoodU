//
//  BusinessNetworking.swift
//  FoodU
//
//  Created by Fredy Camas on 08/10/23.
//

import UIKit
import CoreLocation

protocol BusinessManagmentDelegate{
    func didUpdateBusiness(businessData: [BusinessCardModel])
}

struct BusinessManagment {
    
    let baseURL = "https://api.yelp.com/v3/businesses/search"
    let apikey = "API KEY HERE"
    var delegate:BusinessManagmentDelegate?
    
    func fetchData(latitude: CLLocationDegrees,
                   longitude: CLLocationDegrees,
                   category: String,
                   limit: Int,
                   sortBy: String,
                   locale: String,
                   completionHandler: @escaping ([BusinessCardModel]?, Error?) -> Void) {
        let businessURL = "\(baseURL)?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)"
        
        print(businessURL)
    
    }
}
