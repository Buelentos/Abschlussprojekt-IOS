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
    @StateObject var locationManager = LocationManager()
    
    
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
                
                settingViewModel.delete()
                settingViewModel.removeListener()
            }.foregroundColor(.red)
            
            
            
            //                LocationButton {
            //                    locationManager.requestLocation()
            //                }
            //                .frame(height: 44)
            //                .padding()
            //            // Button ist um standtort zu erfragen
            
            
        }
    }
}

#Preview {
    AccountView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
}
