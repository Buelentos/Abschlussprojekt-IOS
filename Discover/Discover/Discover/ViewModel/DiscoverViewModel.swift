//
//  DiscoverViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 26.03.24.
//

import Foundation

class DiscoverViewModel: ObservableObject {
    
    @Published var repo = Repository.sharedRepo // Darf nicht Published sein! + let statt var + private
    @Published var showFilter = false

    
    func like(bild: FirePost){
        //Hier muss über den angemeldeten User eine Datenbank erstellt werden, wo alle gelikedten bilder/videos gespeichert werden.
        //Zusätzlich, muss geprüft werden, ob das Bild bereits geliked ist. Falls ja, dann muss das Bild getogglet werden auf "filed.heart" andernfalls auf "heart"
    }
    
}
