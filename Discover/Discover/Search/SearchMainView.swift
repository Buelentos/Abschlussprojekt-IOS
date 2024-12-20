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
                    }
                
                ScrollView{
                    ForEach(searchViewModel.listOfPlaces){ searchItem in
                        NavigationLink(value: searchItem) {
                            SearchElement( einSearchElement: searchItem)
                        }
                    }
                }
                .navigationTitle("Search")
                .navigationDestination(for: SearchModel.self, destination: { selectedEvent in
                    SearchDetailView(searchEvent: selectedEvent)
                        .environmentObject(searchViewModel)
                })
                .toolbar{
                    ToolbarItem() {
                        
                        Image(systemName: "location.fill.viewfinder")
                            .frame(width: 100, height: 100).onTapGesture {
                                searchViewModel.showAlert.toggle()
                            }
                    }
                }.alert("Für welchen Ort suchst du?", isPresented: $searchViewModel.showAlert){
                    TextField("Stadtsuche", text: $searchViewModel.userAlertInputLocation )
                }
            }
        }.onAppear{
            searchViewModel.load()
        }
        .onChange(of: searchViewModel.userAlertInputLocation) { oldValue, newValue in
            searchViewModel.load()
        }
    }
}

#Preview {
    SearchMainView()
        .environmentObject(SearchViewModel())
}
