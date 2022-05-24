//
//  SchoolCardView.swift
//  20220524-FredyCamas-NYCSchool
//
//  Created by Fredy Camas on 5/24/22.
//

import SwiftUI

struct SchoolCardView: View {
    @ObservedObject var schoolNetworking = SchoolNetworking()
    @State var search:String = ""
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                
                Color(.white).opacity(0.2)
                    .ignoresSafeArea()
                VStack{
                    Text("NYC School")
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(lineWidth: 1)
                            .frame( height: 50)
                            .foregroundColor(.black)
                            
                        HStack {
                            
                            TextField("Search", text: $search)
                            
                            Button{
                                schoolNetworking.search(searchText: search)
                            }label: {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
                    .padding(.horizontal)
                    ScrollView{
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                            
                            ForEach(schoolNetworking.filteredSchools!){ name in
                                
                                NavigationLink(destination: ExtendedSchoolCardView(cardID: name.id, cardContent: name)) {
                                    CardView(schoolName: name.school_name!,schoolBorough: name.borough!)
                                        .aspectRatio(2/3, contentMode: .fill)
                                }
                                
                            }
                        }
                    }
                }.padding()
                    .navigationBarHidden(true)
                
            }.onAppear {
                self.schoolNetworking.fetchData()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolCardView()
    }
}

/// CardView  display  a rectangular card on the screen with some data.
/// - Parameters:
///   - schoolName: system passes a string to be displayed as the  school name  the cardView
///   - schoolBorugh: system passes a string to be displayed as the  school boroguht the cardView

struct CardView: View {
    var schoolName: String
    var schoolBorough: String
    var body: some View {
        GeometryReader{ geometric in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 25)
                shape
                    .strokeBorder(lineWidth: 3)
                if schoolBorough == "BROOKLYN "{
                    shape.fill().foregroundColor(Color(hexString: "#f7efff"))
                    
                }else if schoolBorough  == "MANHATTAN"{
                    shape.fill().foregroundColor(Color(hexString: "#e3ccff"))
                }else if schoolBorough  == "BRONX    "{
                    shape.fill().foregroundColor(Color(hexString: "#c797ff"))
                } else if schoolBorough  == "QUEENS   "{
                    shape.fill().foregroundColor(Color(hexString: "#ac65ff"))
                }else {
                    shape
                        .fill()
                }
                
                VStack{
                    Text(schoolName)
                        .font(font(geometric.size))
                        .padding()
                    
                    Text(schoolBorough)
                        .font(font(geometric.size))
                        .padding()
                }.foregroundColor(.black)
                
            }
            .foregroundColor(.white)
        }
    }
    
    func font(_ size: CGSize)->Font{
        Font.system(size: min(size.width, size.height)*0.1)
    }
}


/// color extension that takes a string to find its hexadecimal color
extension Color {
   
    init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hexString.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
