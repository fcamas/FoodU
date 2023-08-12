//
//  BusinessData.swift
//  FoodU
//
//  Created by Fredy Camas on 08/09/23.
//

import Foundation

struct BusinessData: Codable{
    
    var businesses:[Businesses]
   
    struct Businesses:Codable {
        var name: String?
        var id   : String?
        var rating  : Float?
        var price  : String?
        var is_closed : Bool?
        var distance : Double?
        var image_url: String?
        var location: Location?
        
    }

    struct Location: Codable{
        var display_address: [String]?
    }
    
}
