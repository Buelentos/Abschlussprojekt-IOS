//
//  SearchDetailView.swift
//  Discover
//
//  Created by Bülent Yavuz on 08.04.24.
//

import SwiftUI

struct SearchDetailView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    var searchEvent: SearchModel
    var body: some View {
        
        ScrollView {
            HStack{
                VStack {
                    
                    Text(searchEvent.title ?? "")
                        .padding(.top)
                        .font(.largeTitle)
                    
                    AsyncImage(
                        url: URL(string: searchEvent.picture ?? ""),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 300)
                                .scaledToFill()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .padding(.horizontal)
                    Text("Beschreibung:")
                        .font(.title)
                    Text(searchEvent.description ?? "")
                    Divider()
                        .background(.black)
                    HStack {
                        Text("Adresse:")
                            .font(.headline)
                        Spacer()
                        Text("\(searchEvent.destination ?? ["",""])")
                    }
                    .padding()
                    Divider()
                        .background(.black)
                    HStack {
                        Text("Rating:")
                            .font(.headline)
                        Spacer()
                        Text("\(Int(searchEvent.rating ?? 2)) von 5")
                    }
                    .padding()
                    Divider()
                        .background(.black)
                    Text("Comments")
                        .padding(.bottom)
                        .font(.title)
                    VStack {
                        HStack {
                            Text("Mentos:")
                                .padding(.leading)
                                .font(.headline)
                            Spacer()
                        }
                        Text("Das Essen ist nicht wie versprochen vegan!!")
                            .padding(.leading)
                    }
                    Divider()
                        .background(.black)
                    VStack {
                        HStack {
                            Text("Fisch:")
                                .padding(.leading)
                                .font(.headline)
                            Spacer()
                        }
                        Text("Er hat mir mein Wechselgeld nicht gegeben!")
                            .padding(.leading)
                    }
                    Divider()
                        .background(.black)
                    VStack {
                        HStack {
                            Text("Bär:")
                                .padding(.leading)
                                .font(.headline)
                            Spacer()
                        }
                        Text("Dieser Pütrüc ist ein Schwerverbrecher!")
                            .padding(.bottom)
                    }
                }
                .padding(.bottom)
            }
            .background(.blue)
            .cornerRadius(20)
            .padding()
        }
    }
}

#Preview {
    SearchDetailView(searchEvent: SearchModel(id: "thfgjk", picture: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/bkVMulDpO4XDhUBmMbIdPdJhhKy1%2FBlatt?alt=media&token=30176601-d959-4581-9439-108d9f4f2e82", title: "Pütrücs Markt", description: "Kleiner Drogeriemarkt", destination: [" BlaBlaStraße 6, PLZ/Ort"], opens: "Öffnungszeiten: Werktags -> 06:00 bis 18:00 Uhr, Sonntags -> Geschlossen ", rating: 3))
        .environmentObject(SearchViewModel())
}
