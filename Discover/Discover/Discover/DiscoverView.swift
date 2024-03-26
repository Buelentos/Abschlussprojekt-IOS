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
        
        
        NavigationStack {
            ScrollView{
                
                HStack {
                    VStack(spacing: 0){
                        ForEach(discoverViewModel.repo.mainList.shuffled()){ reihe in
                                    NavigationLink(value: reihe) {
                                        DiscoverListenElement(einbild: reihe)
                                    }
                                }
                    }
                    
                    VStack(spacing: 0){
                        ForEach(discoverViewModel.repo.mainList.shuffled()){ reihe in
                                    NavigationLink(value: reihe) {
                                        DiscoverListenElement(einbild: reihe)
                                    }
                                }
                    }
                    
                    VStack(spacing: 0){
                        ForEach(discoverViewModel.repo.mainList.shuffled()){ reihe in
                                    NavigationLink(value: reihe) {
                                        DiscoverListenElement(einbild: reihe)
                                    }
                                }
                    }
                    
                }.padding(.leading).padding(.trailing)
                    
                    
                    
                }//ScrollViewKlammer
            .navigationDestination(for: FirePost.self, destination: {
                selectedPicture in
                DiscoverDetailView(bild: selectedPicture)
            })
                
                .searchable(text: $discoverViewModel.repo.searchInputDiscover, placement:  .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Freunde")
                
                .toolbar{
                    
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button() {
                            withAnimation{
                                discoverViewModel.showFilter.toggle()
                            }
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.bordered).background(.blue).cornerRadius(10).padding(.vertical)
                        .padding().sheet(isPresented: $discoverViewModel.showFilter, content: {
                            FilterView()
                                .environmentObject(discoverViewModel)
                        })

                        
                    }
                    
                    
                }
            .navigationTitle("Discover")
        }
        .environmentObject(discoverViewModel)
            
            
            
        
    }//BodyKlammer
}//StructKlammer

#Preview {
    NavigationStack{
        DiscoverView()
            .environmentObject(DiscoverViewModel())
    }
}
