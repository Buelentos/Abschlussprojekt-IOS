//
//  SearchViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 26.03.24.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject{
    
    var searchInput = ""
    @Published var listOfPlaces: [SearchModel] = []
    @Published var selectedCategory: String = ""
    
    
    
    
    
    var searchItemList = [
        SearchModel(id: "thfgjk", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/bkVMulDpO4XDhUBmMbIdPdJhhKy1%2FBlatt?alt=media&token=30176601-d959-4581-9439-108d9f4f2e82", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: ["Adresse: BlaBlaStraße 6, PLZ/Ort"], opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: "3/10"),
        
        SearchModel(id: "jkhkj", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/bkVMulDpO4XDhUBmMbIdPdJhhKy1%2FRote%20Blumen?alt=media&token=f5016ce3-f9ca-4d7e-8792-feffe1dd3e0e", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: ["Adresse: BlaBlaStraße 6, PLZ/Ort"], opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: "3/10"),
        
        SearchModel(id: "oiuztgh", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/bkVMulDpO4XDhUBmMbIdPdJhhKy1%2FWasserfall?alt=media&token=9dcc9d8f-d783-4f7c-a59d-b1b72eb3c205", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: ["Adresse: BlaBlaStraße 6, PLZ/Ort"], opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: "3/10")
    ]
    
    func loadListOfSearchItems(){
        //Hier muss die Liste der SearchItems befüllt werden mit der DatenBank von GoogleMaps
        //um die liste dann anzuzeigen
    }
    
    
    
    func fetchApis() async throws -> [SearchModel]{
        if selectedCategory == "food"{
            guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?sort_by=best_match&limit=20") else {
                throw URLError()
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let searchmodels = try JSONDecoder().decode(FoodApiModel.self, from: data).foodplaces.map{ foodplace in
                SearchModel(id: UUID().uuidString, picture: foodplace.image_url?.absoluteString, title: foodplace.name, description: nil, destination: foodplace.location.display_address, opens: nil, rating: foodplace.rating)
            }
            
            return searchmodels
            
        }
//        else if selectedCategory == "sport" {
//            
//            guard let url = URL(string: "HIER KOMMT DIE ANDERE URL FÜR SPORTAPI") else {
//                throw URLError()
//            }
//            
//            let (data, _) = try await URLSession.shared.data(from: url)
//            
//            let searchmodels = try JSONDecoder().decode(SPORTAPI!!!!!!!!!.self, from: data).foodplaces.map{ SPORTEVENT in
//                SearchModel(id: UUID().uuidString, picture: SPORTEVENT.image_url?.absoluteString, title: SPORTEVENT.name, description: nil, destination: SPORTEVENT.location.display_address, opens: nil, rating: SPORTEVENT.rating)
//            }
//            return searchmodels
//            
//            
//        }
        return []
    }
    
    
    
    
    @MainActor
    func load() {
        Task {
            do {
                
                self.listOfPlaces = try await fetchApis()
                
            } catch {
                print(error)
            }
        }
    }
    
    
}
