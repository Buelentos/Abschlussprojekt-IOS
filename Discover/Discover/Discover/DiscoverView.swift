//
//  DiscoverView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    var body: some View {
        
        HStack {
            Text("Discover").font(.largeTitle).padding(.leading)
            Spacer()
            Button(){
                //Filterfunktion
            } label: {
                Image(systemName: "gear")
            }.background(.blue).foregroundColor(.white).buttonStyle(.bordered).cornerRadius(10).padding(.trailing)
            
            
            
        }
        
        NavigationStack{
            
            ScrollView{
                VStack{
                    ForEach(discoverViewModel.listeDerBilder){ reihe in
                        DiscoverListenElement(einbild: reihe)
                    }
                }.frame(maxWidth: .infinity)
                
                
                
            }//ScrollViewKlammer
            .searchable(text: $discoverViewModel.searchInputDiscover)

        }//NavigationStackKlammer
    }//BodyKlammer
}//StructKlammer

#Preview {
    DiscoverView().environmentObject(DiscoverViewModel())
}
