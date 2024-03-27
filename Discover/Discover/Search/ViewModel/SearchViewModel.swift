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
    
    var searchItemList = [
        SearchModel(id: "thfgjk", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/ZkOpYY3jpRgpWpOWZaSLKrwHc3v2%2FBanane?alt=media&token=3abccf0b-4cca-4f71-9de4-d2f34a4f6d39", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: "Adresse: BlaBlaStraße 6, PLZ/Ort", opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: "3/10"),
        
        SearchModel(id: "jkhkj", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/ZkOpYY3jpRgpWpOWZaSLKrwHc3v2%2FBanane?alt=media&token=3abccf0b-4cca-4f71-9de4-d2f34a4f6d39", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: "Adresse: BlaBlaStraße 6, PLZ/Ort", opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: "3/10"),
        
        SearchModel(id: "oiuztgh", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/ZkOpYY3jpRgpWpOWZaSLKrwHc3v2%2FBanane?alt=media&token=3abccf0b-4cca-4f71-9de4-d2f34a4f6d39", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: "Adresse: BlaBlaStraße 6, PLZ/Ort", opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: "3/10")
    ]
    
    func loadListOfSearchItems(){
        //Hier muss die Liste der SearchItems befüllt werden mit der DatenBank von GoogleMaps
        //um die liste dann anzuzeigen
    }
    
}
