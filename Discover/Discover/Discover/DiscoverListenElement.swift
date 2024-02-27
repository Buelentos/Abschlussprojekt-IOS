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
            Image(einbild.einBildReihe).resizable().frame(width: 300, height: 150)
        }else {
            HStack{
                Image(einbild.einBildReihe).resizable().frame(width: 150, height: 150)
                Image(einbild.zweiBilder!).resizable().frame(width: 150, height: 150)
            }
        }
    }
}

#Preview {
    DiscoverListenElement(einbild: EinBildReihe(einBildReihe: .logo))
}
