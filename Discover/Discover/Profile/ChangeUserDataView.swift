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
                TextField("Ich bin 95er, habe spaß an Fußball spielen & gucken", text: $profileViewModel.userInputUserDescription)
            }
            
            HStack {
                Spacer()
                Button("Änderungen speichern"){
                    profileViewModel.userDetailsUpdate()
                    profileViewModel.showSheetUserData.toggle()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ChangeUserDataView()
        .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
}
