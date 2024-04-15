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
    @Published var selectedCategory: FilterOptions = .food
    @Published var showAlert = false
    @Published var userAlertInputLocation = "Hamburg"
    
    
    enum FilterOptions: String, CaseIterable {
        case food = "Food"
        case sport = "Sport"
        case gaming = "Gaming"
        case event = "Event"
    }
    
    
    
    
    func fetchApis() async throws -> [SearchModel]{
        let headers = [
            "accept": "application/json",
            "Authorization": apiKey
        ]
        if selectedCategory == .food {
            let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/businesses/search?sort_by=best_match&limit=20&location=\(userAlertInputLocation)")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            
            
            let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
            
            let searchmodels = try JSONDecoder().decode(FoodApiModel.self, from: data).businesses.map{ foodplace in
                SearchModel(id: UUID().uuidString, picture: foodplace.image_url?.absoluteString, title: foodplace.name ?? "Fisch", description: nil, destination: foodplace.location?.display_address ?? ["Fisch","Street"], opens: nil, rating: foodplace.rating ?? 2)
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
