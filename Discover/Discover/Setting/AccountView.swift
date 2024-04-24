//
//  AccountView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import SwiftUI
import _CoreLocationUI_SwiftUI

struct AccountView: View {
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    var body: some View {
        
        List (){
            Button("Abmelden"){
                authViewModel.logout()
                settingViewModel.removeListener()
            }.foregroundColor(.blue)
            
            Button("Account löschen"){
                settingViewModel.delete()
                settingViewModel.removeListener()
            }.foregroundColor(.red)
        }
    }
}

#Preview {
    AccountView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
}
