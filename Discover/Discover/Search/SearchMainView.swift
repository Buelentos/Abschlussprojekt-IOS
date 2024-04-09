//
//  SearchMainView.swift
//  Discover
//
//  Created by Bülent Yavuz on 12.03.24.
//

import SwiftUI

struct SearchMainView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    var body: some View {
        
        NavigationStack {
            HStack{
                Picker("Category", selection: $searchViewModel.selectedCategory) {
                    Text("FOOD")
                    Text("SPORT")
                }
                ScrollView{
                    ForEach(searchViewModel.searchItemList){ searchItem in
                        NavigationLink(value: searchItem) {
                            SearchElement( einSearchElement: searchItem)
                        }
                    }
                }
                .navigationTitle("Search")
                
                //Oben muss noch die Filterfunktion von aktivitäten, sport, essen, gaming eingebracht werden
                .searchable(text: $searchViewModel.searchInput, placement:  .navigationBarDrawer(displayMode: .always), prompt: "Suche nach etwas konkretem")
                
                .navigationDestination(for: SearchModel.self, destination: { selectedEvent in
                    SearchDetailView(searchEvent: selectedEvent)
                        .environmentObject(searchViewModel)
                    
                })
                
            }
        }
    }
}

#Preview {
    SearchMainView()
        .environmentObject(SearchViewModel())
}
