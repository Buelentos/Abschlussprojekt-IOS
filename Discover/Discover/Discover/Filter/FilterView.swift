//
//  FilterView.swift
//  Discover
//
//  Created by Bülent Yavuz on 13.03.24.
//

import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject private var discoverViewModel: DiscoverViewModel
    
    
    var body: some View {
        
        
        List{
            Section(header: Text("Please choise your destination")){
                
                VStack{
                    
                    Picker("Country", selection: $discoverViewModel.selectedCountry){
                        ForEach(discoverViewModel.country, id: \.self){
                            Text($0)
                        }
                    }
                    
                    
                    if discoverViewModel.selectedCountry == "Deutschland" {
                        Picker("City", selection: $discoverViewModel.selectedCity){
                            ForEach(discoverViewModel.citiesOfGermany, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    else if (discoverViewModel.selectedCountry == "Türkiye"){
                        Picker("City", selection: $discoverViewModel.selectedCity){
                            ForEach(discoverViewModel.citiesOfTurkey, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    else if (discoverViewModel.selectedCountry == "USA"){
                        Picker("City", selection: $discoverViewModel.selectedCity){
                            ForEach(discoverViewModel.citiesOfUSA, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    
                }
            }
            
            Picker("category", selection: $discoverViewModel.selectedFisch){
                ForEach(discoverViewModel.categories, id: \.self){
                    Text($0)
                }
            }
            
            Section{
                HStack{
                    Spacer()
                    Button("Save settings"){
                        discoverViewModel.showFilter.toggle()
                        if !discoverViewModel.selectedCountry.isEmpty {
                            print(discoverViewModel.selectedCountry)
                        }
                    }
                    Spacer()
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    FilterView()
        .environmentObject(DiscoverViewModel())
}
