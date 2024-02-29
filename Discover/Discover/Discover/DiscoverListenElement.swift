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
        if(einbild.zweiBilder == nil){
            Image(einbild.einBildReihe).resizable().frame(height: 180).border(.white)
        }else {
            HStack(spacing: 0){
                Image(einbild.einBildReihe).resizable().frame(maxHeight: 150).border(.white)
                Image(einbild.zweiBilder!).resizable().frame(maxHeight: 150).border(.white)
            }
        }
    }
}

#Preview {
    DiscoverListenElement(einbild: EinBildReihe(einBildReihe: .logo))
}
