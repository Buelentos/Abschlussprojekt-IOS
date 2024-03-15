//
//  EinBildReihe.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
import SwiftUI

struct EinBildReihe: Identifiable, Hashable{
    var id = UUID()
    var einBildReihe: ImageResource
    var tag = ""
    var beschreibung = ""
    var likes: Int = 0
    var coments = [""]
 
    init(einBildReihe: ImageResource) {
        self.einBildReihe = einBildReihe
    }
    
}



