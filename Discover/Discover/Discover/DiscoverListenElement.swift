//
//  DiscoverListenElement.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct DiscoverListenElement: View {
    var einbild: EinBildReihe
    
    
    var body: some View {
        
        HStack {
            Image(einbild.einBildReihe).resizable().frame(width: 140, height: 140)
        }
    }
}

#Preview {
    DiscoverListenElement(einbild: EinBildReihe(einBildReihe: .logo))
}
