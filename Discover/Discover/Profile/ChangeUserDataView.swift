//
//  ChangeUserDataView.swift
//  Discover
//
//  Created by Bülent Yavuz on 18.04.24.
//

import SwiftUI

struct ChangeUserDataView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    var body: some View {
        List {
            Section("Username"){
                TextField("UserName", text: $profileViewModel.userInputUserName)
            }
            Section("Beschreibung"){
                TextField("Ich bin 95er, habe spaß an Fußball spielen & gucken", text: $profileViewModel.userInputUserName)
            }
            
            
            HStack {
                Spacer()
                Button("Änderungen speichern"){
                    //Die änderungen müssen per Funktion übernommen werden, welche in der ProfileViewModel vorbereitet werden muss
                    
                    profileViewModel.showSheetUserData.toggle()
                }
                Spacer()
            }
            Section(){
                HStack {
                    Spacer()
                    Button("Bild Löschen"){
                        // Funktion um ausgewähltes bild zu löschen
                        // View um hochgeladene Bilder anzuzeigen um bild zu löschen
                    }.foregroundColor(.red)
                    Spacer()
                }
            }
            
        }
    }
}

#Preview {
    ChangeUserDataView()
        .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
}
