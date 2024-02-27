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
        NavigationStack{
                    
                    List(discoverViewModel.listeDerBilder){ reihe in
                        DiscoverListenElement(einbild: reihe)
                    }
                
                
                    
                
                
                
            .padding()
                .toolbar(content:{
                HStack{
                    Text("Discover").font(.largeTitle)
                    Spacer()
                    Text("#Hamburg").foregroundStyle(.white).frame(width: 130, height: 30).background(.blue).cornerRadius(15)
                }
            })
            
        }//NavigationStackKlammer
    }//BodyKlammer
}//StructKlammer

#Preview {
    DiscoverView().environmentObject(DiscoverViewModel())
}
