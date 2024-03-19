//
//  DiscoverListenElement.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct DiscoverListenElement: View {
    var einbild: Firepicture
    
    
    var body: some View {
        
        HStack {
            Image(einbild.einBildReihe).resizable().scaledToFit().border(.white)
        }
    }
}

#Preview {
    DiscoverListenElement(einbild: Firepicture(einBildReihe: .logo))
}
