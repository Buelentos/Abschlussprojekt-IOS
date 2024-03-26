//
//  DiscoverDetailView.swift
//  Discover
//
//  Created by Bülent Yavuz on 15.03.24.
//

import SwiftUI

struct DiscoverDetailView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    var bild: FirePost

    var body: some View {
        
        ScrollView{
            VStack{
                
                Text("TAG: \(bild.tag)")
                
                AsyncImage(
                    url: URL(string: bild.url),
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
                
                HStack{
                    VStack {
                        Image(systemName: "heart").onTapGesture {
                            
                        }
                        Text("\(bild.likes)")
                    }
                    VStack {
                        Image(systemName: "text.bubble")
                        Text("Comments")

                    }
                    Spacer()
                    Image(systemName: "paperplane")
                    Image(systemName: "bookmark").padding(.trailing)
                    
                }.padding(.top).padding(.leading)
                
                Text("Beschreibung: \n\(bild.beschreibung)").padding()
                
            }
        }//ScrollViewKlammer
    }
}

#Preview{
    DiscoverDetailView(bild: FirePost(id: "1", url: "https://firebasestorage.googleapis.com:443/v0/b/discover-68f7d.appspot.com/o/ZkOpYY3jpRgpWpOWZaSLKrwHc3v2%2FBanane?alt=media&token=3abccf0b-4cca-4f71-9de4-d2f34a4f6d39", tag: "jk", beschreibung: "jk", likes: 2, comments: ["fdhgysfgv"]))
}
