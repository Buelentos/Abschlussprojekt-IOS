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
                        .frame(width: 121, height: 121)
                        .scaledToFill()
                        .padding(.vertical)
                        
                },
                placeholder: {
                    ProgressView()
                }
            )
        }.background(.gray.opacity(0.2))
    }
}

#Preview {
    DiscoverListenElement(einbild: FirePost(id: "hdjsfbsdf", url: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/ZkOpYY3jpRgpWpOWZaSLKrwHc3v2%2FBanane?alt=media&token=3abccf0b-4cca-4f71-9de4-d2f34a4f6d39", tag: "#test", beschreibung: "Testbeschreibung", likes: 3, comments: ["String"]))
}
