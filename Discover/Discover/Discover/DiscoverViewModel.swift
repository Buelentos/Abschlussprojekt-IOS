//
//  DiscoverViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
import SwiftUI


class DiscoverViewModel: ObservableObject{
    @Published var repo = Repository.sharedRepo
    @Published var showFilter = false

    
    func like(bild: EinBildReihe){
        //Hier muss über den angemeldeten User eine Datenbank erstellt werden, wo alle gelikedten bilder/videos gespeichert werden.
        //Zusätzlich, muss geprüft werden, ob das Bild bereits geliked ist. Falls ja, dann muss das Bild getogglet werden auf "filed.heart" andernfalls auf "heart"
    }
}
