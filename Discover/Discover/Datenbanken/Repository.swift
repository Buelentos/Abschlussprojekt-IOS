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
    
    
     var listeDerBilder = [
        EinBildReihe(einBildReihe: .logo, zweiBilder: .a),
        EinBildReihe(einBildReihe: .b, zweiBilder: .c),
        EinBildReihe(einBildReihe: .d),
        EinBildReihe(einBildReihe: .e, zweiBilder: .f),
        EinBildReihe(einBildReihe: .g),
        EinBildReihe(einBildReihe: .h, zweiBilder: .i),
        EinBildReihe(einBildReihe: .j),
        EinBildReihe(einBildReihe: .k, zweiBilder: .l),
        EinBildReihe(einBildReihe: .m),
        EinBildReihe(einBildReihe: .n, zweiBilder: .o),

    ]
    
    
    
    @Published var selectedCountry = ""
    @Published var country = ["", "Deutschland", "Türkiye", "USA"]
    @Published var selctedCity = ""
    @Published var citiesOfGermany = ["Berlin", "Hamburg", "Frankfurt", "Stuttgart"]
    @Published var citiesOfTurkey = ["Ankara", "Istanbul", "Kars", "Ardahan"]
    @Published var citiesOfUSA = ["Washington", "New York", "Compton", "Miami"]
    @Published var categories = ["All", "Sport", "Dinner", "Fun", "Gaming"]
    
    
    
     var emailAdress: String = ""
     var benutzername: String = ""
     var password: String = ""
    
     var zeigeButtons: Bool = false
     var istAngemeldet: Bool = false
    
    
}
