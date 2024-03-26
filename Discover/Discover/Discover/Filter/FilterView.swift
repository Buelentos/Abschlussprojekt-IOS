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
                Picker("Country", selection: $discoverViewModel.repo.selectedCountry){
                    ForEach(discoverViewModel.repo.country, id: \.self){
                        Text($0)
                    }
                }
                
                if discoverViewModel.repo.selectedCountry == "Deutschland" {
                    Picker("City", selection: $discoverViewModel.repo.selctedCity){
                        ForEach(discoverViewModel.repo.citiesOfGermany, id: \.self){
                            Text($0)
                        }
                    }
                }
                else if (discoverViewModel.repo.selectedCountry == "Türkiye"){
                    Picker("City", selection: $discoverViewModel.repo.selctedCity){
                        ForEach(discoverViewModel.repo.citiesOfTurkey, id: \.self){
                            Text($0)
                        }
                    }
                }
                else if (discoverViewModel.repo.selectedCountry == "USA"){
                    Picker("City", selection: $discoverViewModel.repo.selctedCity){
                        ForEach(discoverViewModel.repo.citiesOfUSA, id: \.self){
                            Text($0)
                        }
                    }
                }
                    
                
            }
            
            Picker("category", selection: $discoverViewModel.repo.categories){
                ForEach(discoverViewModel.repo.categories, id: \.self){
                    Text($0)
                }
            }
            
            Section{
                HStack{
                    Spacer()
                    Button("Save settings"){
                        discoverViewModel.showFilter.toggle()
                        if !discoverViewModel.repo.selectedCountry.isEmpty {
                            print(discoverViewModel.repo.selectedCountry)
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
