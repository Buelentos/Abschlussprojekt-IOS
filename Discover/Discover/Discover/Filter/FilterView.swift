//
//  FilterView.swift
//  Discover
//
//  Created by Bülent Yavuz on 13.03.24.
//

import SwiftUI

struct FilterView: View {
    
    @State private var people: Float = 1
    @State private var price: Float = 0
    @State private var selectedCountry = ""
    @State private var country = ["", "Deutschland", "Türkiye", "USA"]
    @State private var selctedCity = ""
    @State private var citiesOfGermany = ["Berlin", "Hamburg", "Frankfurt", "Stuttgart"]
    @State private var citiesOfTurkey = ["Ankara", "Istanbul", "Kars", "Ardahan"]
    @State private var citiesOfUSA = ["Washington", "New York", "Compton", "Miami"]
    @State private var categories = ["All", "Sport", "Dinner", "Fun", "Gaming"]

    
    var body: some View {


        List{
            Section(header: Text("Please choise your destination")){
                Picker("Country", selection: $selectedCountry){
                    ForEach(country, id: \.self){
                        Text($0)
                    }
                }
                
                if selectedCountry == "Deutschland" {
                    Picker("City", selection: $selctedCity){
                        ForEach(citiesOfGermany, id: \.self){
                            Text($0)
                        }
                    }
                }
                else if (selectedCountry == "Türkiye"){
                    Picker("City", selection: $selctedCity){
                        ForEach(citiesOfTurkey, id: \.self){
                            Text($0)
                        }
                    }
                }
                else if (selectedCountry == "USA"){
                    Picker("City", selection: $selctedCity){
                        ForEach(citiesOfUSA, id: \.self){
                            Text($0)
                        }
                    }
                }
                    
                
            }
            
            Picker("category", selection: $categories){
                ForEach(categories, id: \.self){
                    Text($0)
                }
            }
            
            Section{
                HStack{
                    Spacer()
                    Button("Save settings"){
                    }
                    Spacer()
                }
            }
            
            
        }


    }
}

#Preview {
    FilterView()
}
