//
//  AccountView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    
    var body: some View {
        List (){
            Button("Abmelden"){
                authViewModel.logout()
                settingViewModel.removeListener()
            }.foregroundColor(.blue)
            
            Button("Account deaktivieren"){
                //ACcount deaktivieren funktion
                //Es müssen alle bilder die von diesem Account erstellt wurden aus den Listen gelöscht werden, wo sie hochgeladen wurden
                settingViewModel.removeListener()
            }.foregroundColor(.orange)
            
            Button("Account löschen"){
                //Es müssen alle bilder die von diesem Account erstellt wurden aus den Listen gelöscht werden, wo sie hochgeladen wurden
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
