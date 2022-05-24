//
//  SatNetworking.swift
//  20220524-FredyCamas-NYCSchool
//
//  Created by Fredy Camas on 5/24/22.
//

import Foundation
class SatNetworking: ObservableObject {
    
    /// satCard.-  hold  user tapped card inforamtion
    @Published var satCard: SatData? = SatData()

    /// fetchdata.-  call network and parse api data
    /// - Parameters:
    ///   - newCard: user tapped card id
    func fetchData(_ newCard: String?) {
        if let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode( [SatData].self, from: safeData)
                            DispatchQueue.main.async {
                                results.forEach{ card in
                                    
                                    if card.dbn == newCard{
                                        self.satCard = card
                                    }
                                }
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
}
