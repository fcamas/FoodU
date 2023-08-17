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
        performRequest(businessURL:businessURL)
    }
    func performRequest(businessURL:String){
       
        guard  let url = URL(string: businessURL) else {return}
       var request = URLRequest(url: url)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            if error == nil{
                
            }
            
            if let newData = data {
                
               let dataString = String(data: newData, encoding: .utf8)
                print(dataString)
               
            }
           
        }
        task.resume()
    }
}
