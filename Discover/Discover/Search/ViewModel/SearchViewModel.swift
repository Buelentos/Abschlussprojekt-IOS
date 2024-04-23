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
        
        else if selectedCategory == .event {
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/events?limit=20&location=\(userAlertInputLocation)&start_date=\(Int(Date().timeIntervalSince1970))")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            
            let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
            print(String(decoding: data, as: UTF8.self))
            
            let searchmodels = try JSONDecoder().decode(EventAPIModel.self, from: data).events.map{ event in
                SearchModel(id: UUID().uuidString, picture: event.image_url?.absoluteString, title: event.name ?? "Fisch", description: event.description ?? "lala", destination: event.location?.display_address ?? ["Fisch","Street"], opens: nil, rating: nil)
            }
            return searchmodels
        }
        else if selectedCategory == .sport {
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/businesses/search?categories=active&limit=20&location=\(userAlertInputLocation)")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            
            let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
            print(String(decoding: data, as: UTF8.self))
            
            let searchModels = try JSONDecoder().decode(SportAPIModel.self, from: data).businesses.map{ sport in
                SearchModel(id: UUID().uuidString, picture: sport.image_url?.absoluteString, title: sport.name ?? "Fisch", description: nil, destination: sport.location?.display_address ?? ["Fisch","Street"], opens: nil, rating: sport.rating ?? 2)
            }
            
            return searchModels
        }
        else if selectedCategory == .gaming {
            try await fetchGamingApi()
            
        }
        
        return []
    }
    
    
    func fetchGamingApi() async throws -> [SearchModel]{
        let request = NSMutableURLRequest(url: NSURL(string: "https://www.freetogame.com/api/games")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
        
        let searchModels = try JSONDecoder().decode([Game].self, from: data).map{ game in
            SearchModel(id: UUID().uuidString, picture: game.thumbnail?.absoluteString, title: game.title, description: game.short_description, destination: nil, opens: nil, rating: nil)
        }
        
        return searchModels
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
