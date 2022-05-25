//
//  SchoolNetworking.swift
//  20220524-FredyCamas-NYCSchool
//
//  Created by Fredy Camas on 5/24/22.
//

import Foundation
import SwiftUI

class SchoolNetworking: ObservableObject {
    /// schoolData.-  hold all data from the api
    @Published var schoolData: [SchoolData]? = [SchoolData]()
    /// schoolData.-  hold sorted data from useri
    @Published var filteredSchools: [SchoolData]? = [SchoolData]()
    
    /// fetchData.-  call network and parse data
    func fetchData() {
        if let url = URL(string: "https://data.cityofnewyork.us/resource/uq7m-95z8.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode( [SchoolData].self, from: safeData)
                            DispatchQueue.main.async {
                                self.schoolData = results
                                
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    /// search.-  modify filterSchools container to display sort data
    /// - Parameters:
    ///   - searchText: user input to be sorted
    func search(searchText:String){
         
        DispatchQueue.main.async {
            self.filteredSchools = searchText.isEmpty ? self.schoolData : self.schoolData?.filter({ (school: SchoolData) -> Bool in
               
                return school.school_name?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            })
        }
    }
}
