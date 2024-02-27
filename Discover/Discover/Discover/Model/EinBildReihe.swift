//
//  EinBildReihe.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
import SwiftUI

class EinBildReihe: Identifiable{
    var id = UUID()
    var einBildReihe: ImageResource
    var zweiBilder: ImageResource?
 
    init(einBildReihe: ImageResource) {
        self.einBildReihe = einBildReihe
    }
    
    init(einBildReihe: ImageResource, zweiBilder: ImageResource) {
        self.einBildReihe = einBildReihe
        self.zweiBilder = zweiBilder
    }
    
    
}



