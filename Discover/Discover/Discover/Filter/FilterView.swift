//
//  FilterView.swift
//  Discover
//
//  Created by Bülent Yavuz on 13.03.24.
//

import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel

    
    var body: some View {


        List{
            Section(header: Text("Please choise your destination")){
                Picker("Country", selection: $viewModel.repo.selectedCountry){
                    ForEach(viewModel.repo.country, id: \.self){
                        Text($0)
                    }
                }
                
                if viewModel.repo.selectedCountry == "Deutschland" {
                    Picker("City", selection: $viewModel.repo.selctedCity){
                        ForEach(viewModel.repo.citiesOfGermany, id: \.self){
                            Text($0)
                        }
                    }
                }
                else if (viewModel.repo.selectedCountry == "Türkiye"){
                    Picker("City", selection: $viewModel.repo.selctedCity){
                        ForEach(viewModel.repo.citiesOfTurkey, id: \.self){
                            Text($0)
                        }
                    }
                }
                else if (viewModel.repo.selectedCountry == "USA"){
                    Picker("City", selection: $viewModel.repo.selctedCity){
                        ForEach(viewModel.repo.citiesOfUSA, id: \.self){
                            Text($0)
                        }
                    }
                }
                    
                
            }
            
            Picker("category", selection: $viewModel.repo.categories){
                ForEach(viewModel.repo.categories, id: \.self){
                    Text($0)
                }
            }
            
            Section{
                HStack{
                    Spacer()
                    Button("Save settings"){
                        viewModel.showFilter.toggle()
                        if !viewModel.repo.selectedCountry.isEmpty {
                            print(viewModel.repo.selectedCountry)
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
        .environmentObject(MainViewModel())
}
