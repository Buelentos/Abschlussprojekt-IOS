//
//  Repository.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
class Repository {
    
    static var sharedRepo = Repository()
    
    var searchInputDiscover = ""
    
    var mainList = [FirePost]()
    
    var selectedCountry = ""
    var country = ["", "Deutschland", "Türkiye", "USA"]
    var selctedCity = ""
    var citiesOfGermany = ["Berlin", "Hamburg", "Frankfurt", "Stuttgart"]
    var citiesOfTurkey = ["Ankara", "Istanbul", "Kars", "Ardahan"]
    var citiesOfUSA = ["Washington", "New York", "Compton", "Miami"]
    var categories = ["All", "Sport", "Dinner", "Fun", "Gaming"]
   
    var emailAdress: String = ""
    var benutzername: String = ""
    var password: String = ""
    
    var zeigeButtons: Bool = false
    var istAngemeldet: Bool = false
    
    
}
