//
//  DiscoverView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject private var viewModel: MainViewModel

    var body: some View {
        
        
        NavigationStack {
            ScrollView{
                
                HStack {
                    VStack(spacing: 0){
                        ForEach(viewModel.repo.mainList.shuffled()){ reihe in
                                    NavigationLink(value: reihe) {
                                        DiscoverListenElement(einbild: reihe)
                                    }
                                }
                    }
                    
                    VStack(spacing: 0){
                        ForEach(viewModel.repo.mainList.shuffled()){ reihe in
                                    NavigationLink(value: reihe) {
                                        DiscoverListenElement(einbild: reihe)
                                    }
                                }
                    }
                    
                    VStack(spacing: 0){
                        ForEach(viewModel.repo.mainList.shuffled()){ reihe in
                                    NavigationLink(value: reihe) {
                                        DiscoverListenElement(einbild: reihe)
                                    }
                                }
                    }
                    
                }.padding(.leading).padding(.trailing)
                    
                    
                    
                }//ScrollViewKlammer
            .navigationDestination(for: EinBildReihe.self, destination: {
                selectedPicture in
                DiscoverDetailView(bild: selectedPicture)
            })
                
                .searchable(text: $viewModel.repo.searchInputDiscover, placement:  .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Freunde")
                
                .toolbar{
                    
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button() {
                            withAnimation{
                                viewModel.showFilter.toggle()
                            }
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.bordered).background(.blue).cornerRadius(10).padding(.vertical)
                        .padding().sheet(isPresented: $viewModel.showFilter, content: {
                            FilterView()
                        })//Sheet muss von rechts rein sliden

                        
                    }
                    
                    
                }
            .navigationTitle("Discover")
        }
            
            
            
        
    }//BodyKlammer
}//StructKlammer

#Preview {
    NavigationStack{
        DiscoverView()
            .environmentObject(MainViewModel())
    }
}
