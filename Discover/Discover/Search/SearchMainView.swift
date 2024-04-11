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
            VStack{
                Picker(selection: $searchViewModel.selectedCategory, label: Text("bug")) {
                    ForEach(SearchViewModel.FilterOptions.allCases, id: \.self){ option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(.segmented).padding(.horizontal)
                    .onChange(of: searchViewModel.selectedCategory) { oldValue, newValue in
                        searchViewModel.load()
                        print("fisch oder was du willst")
                    }
                ScrollView{
                    ForEach(searchViewModel.listOfPlaces){ searchItem in
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
                
                .toolbar{
                    
                    ToolbarItem() {
                        
                        
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    SearchMainView()
        .environmentObject(SearchViewModel())
}
