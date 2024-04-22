//
//  SearchElement.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import SwiftUI

struct SearchElement: View {
    
    @EnvironmentObject var searchViewModel: SearchViewModel
    var einSearchElement: SearchModel
    
    var body: some View {
        
        HStack{
            AsyncImage(
                url: URL(string: einSearchElement.picture ?? ""),
                content: { image in
                    image.resizable().frame(width: 100, height: 100).cornerRadius(15)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Spacer()
            Divider().background(.black)
            Spacer()
            VStack {
                Text(einSearchElement.title ?? "lala")
                Text(einSearchElement.description ?? "")
                Text("Rating: \(einSearchElement.rating?.formatted() ?? "0")")
            }.foregroundColor(.black)
            Spacer()
        }.padding().frame(width: 350,height: 120).background(.blue).cornerRadius(20)
        
    }
}

#Preview {
    SearchElement(einSearchElement: SearchModel(id: "thfgjk", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/ZkOpYY3jpRgpWpOWZaSLKrwHc3v2%2FBanane?alt=media&token=3abccf0b-4cca-4f71-9de4-d2f34a4f6d39", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: ["Adresse: BlaBlaStraße 6, PLZ/Ort"], opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: 3))
        .environmentObject(SearchViewModel())
}
