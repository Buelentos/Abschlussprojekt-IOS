//
//  DiscoverListenElement.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct DiscoverListenElement: View {
    var einbild: FirePost
    
    
    var body: some View {
        
        HStack {
            AsyncImage(
                url: URL(string: einbild.url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .scaledToFill()
                },
                placeholder: {
                    ProgressView()
                }
            )
        }
    }
}

//#Preview {
//    DiscoverListenElement(einbild: FirePost(einBildReihe: .logo))
//}
