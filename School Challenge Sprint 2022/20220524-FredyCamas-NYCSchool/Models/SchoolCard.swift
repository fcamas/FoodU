//
//  SchoolModel.swift
//  20220524-FredyCamas-NYCSchool
//
//  Created by Fredy Camas on 5/24/22.
//

import Foundation

struct SchoolCard: Decodable,Identifiable {
    var id:String? {
        return dbn
    }
    var dbn: String?
    var school_name: String?
    var overview_paragraph: String?
    var latitude: String?
    var longitude: String?
    var total_students: String?
    var location: String?
    var phone_number: String?
    var school_email: String?
    var website: String?
    var borough: String?
    var bin:String?
    
    var longitudeDouble: Double? {
        return Double(longitude ?? "00")
    }
    var latitudeDouble: Double? {
        return Double(latitude ?? "00")
    }
    
    
    
}

struct SatCard: Decodable,Identifiable {
    var id:String? {
        return dbn
    }
    var dbn: String?
    var school_name: String?
    var num_of_sat_test_takers: String?
    var sat_critical_reading_avg_score: String?
    var sat_math_avg_score: String?
    var sat_writing_avg_score: String?
   
    
    
}


