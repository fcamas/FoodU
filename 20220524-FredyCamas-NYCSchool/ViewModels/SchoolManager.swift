//
//  SchoolViewModel.swift
//  20220524-FredyCamas-NYCSchool
//
//  Created by Life on 5/25/22.
//

import Foundation

class SchoolManager: ObservableObject {
   
    @Published var schoolCards: [SchoolCard]? = [SchoolCard]()
    @Published var filterSchoolCards: [SchoolCard]? = [SchoolCard]()
    @Published var satCards: [SatCard]? = [SatCard]()
    @Published var satCard: SatCard? = SatCard()
    
    /// search.-  modify filterSchools container to display sort data
    /// - Parameters:
    ///   - searchText: user input to be sorted
    func search(searchText:String){
        
        DispatchQueue.main.async {
            self.filterSchoolCards = searchText.isEmpty ? self.schoolCards : self.schoolCards?.filter({ (school: SchoolCard) -> Bool in
                
                return school.school_name?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            })
        }
    }
    
    func fetchSchoolData(){
        let url = URL(string: "https://data.cityofnewyork.us/resource/uq7m-95z8.json")!
        URLSession.shared.fetchData(for: url) { (result: Result<[SchoolCard], Error>) in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    print(results)
                    self.schoolCards = results
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchSatData( newCard: String?){
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
        URLSession.shared.fetchData(for: url) { (result: Result<[SatCard], Error>) in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    results.forEach{ card in
                        
                        if card.dbn == newCard{
                            self.satCard = card
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
