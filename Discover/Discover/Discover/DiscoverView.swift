//
//  DiscoverView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    @EnvironmentObject private var testModel: AuthentificationViewModel
    

    var body: some View {
        
        
            ScrollView{
                VStack(spacing: 0){
                    
                    ForEach(discoverViewModel.repo.listeDerBilder){ reihe in
                        DiscoverListenElement(einbild: reihe)
                    }
                }.frame(maxWidth: .infinity)
                
                
                
            }//ScrollViewKlammer
            
            .searchable(text: $discoverViewModel.repo.searchInputDiscover, placement:  .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Freunde")
            
            .toolbar{
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button() {
                        
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.bordered).background(.blue).cornerRadius(10).padding(.vertical)
                    .padding()
                    
                }
                
                
            }
            .navigationTitle("Discover")
            
            
            
        
    }//BodyKlammer
}//StructKlammer

#Preview {
    NavigationStack{
        DiscoverView().environmentObject(DiscoverViewModel()).environmentObject(AuthentificationViewModel())
    }
}
