//
//  ExtendedSchoolCardView.swift
//  20220524-FredyCamas-NYCSchool
//
//  Created by Fredy Camas on 5/24/22.
//

import SwiftUI
import MapKit

struct ExtendedSchoolCardView: View {
    
    let cardID: String?
    let cardContent: SchoolData?
    @ObservedObject var satNetworking = SatNetworking()
    
    @State var coordinateRegion: MKCoordinateRegion = {
        var newRegion = MKCoordinateRegion()
        newRegion.center.latitude = 37.786996
        newRegion.center.longitude = -122.440100
        newRegion.span.latitudeDelta = 0.2
        newRegion.span.longitudeDelta = 0.2
        return newRegion
    }()
    @State var annotationItems: [MyAnnotationItem] = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.477450)),
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.786996, longitude: -122.419281)),
    ]
    
    var body: some View {
        ScrollView{
            VStack {
                VStack {
                    
                    Map(coordinateRegion: $coordinateRegion,
                        annotationItems: annotationItems) {item in
                        MapPin(coordinate: item.coordinate)
                    }
                }
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                
                
                VStack(alignment: .leading) {
                    Text(cardContent?.location! ?? "")
                    Group{
                        
                        Text(cardContent?.school_email ?? "")
                        Text(cardContent?.phone_number ?? "")
                        
                    }.font(.subheadline)
                        .foregroundColor(.blue)
                    Divider()
                    
                    Group{
                        HStack{
                            Text("Sat reading score:")
                            Text(satNetworking.satCard?.sat_critical_reading_avg_score ?? "")
                        }
                        
                        HStack{
                            Text("Sat writing score:")
                            Text(satNetworking.satCard?.sat_writing_avg_score ?? "")
                        }
                        HStack{
                            Text("Sat math score:")
                            Text(satNetworking.satCard?.sat_math_avg_score ?? "")
                        }
                        
                    }.font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(cardContent?.borough! ?? "")
                        .font(.title2)
                    Text(cardContent?.overview_paragraph! ?? "")
                }
                .padding()
                
                Spacer()
            }.onAppear(){
                satNetworking.fetchData(cardID)
                
                let coordinateRegionn: MKCoordinateRegion = {
                    var newRegion = MKCoordinateRegion()
                    newRegion.center.latitude = cardContent?.latitudeDouble ?? 00
                    newRegion.center.longitude = cardContent?.longitudeDouble ?? 00
                    newRegion.span.latitudeDelta = 0.15
                    newRegion.span.longitudeDelta = 0.15
                    return newRegion
                }()
                
                let annotationItemsn: [MyAnnotationItem] = [
                    MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: cardContent?.latitudeDouble ?? 00 , longitude:cardContent?.longitudeDouble ?? 00))]
                coordinateRegion = coordinateRegionn
                annotationItems = annotationItemsn
                
            }
        }.navigationBarTitle(cardContent?.school_name ?? "" ,  displayMode: .automatic)
    }
    
}


struct ContentViewB_Previews: PreviewProvider {
    static var previews: some View {
        let schoolData = SchoolData()
        ExtendedSchoolCardView(cardID: "No Data", cardContent: schoolData)
    }
}

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}
