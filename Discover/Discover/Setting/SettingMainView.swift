//
//  ABMELDEBUTTON.swift
//  Discover
//
//  Created by Bülent Yavuz on 29.02.24.
//

import SwiftUI

struct SettingMainView: View {
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    
    var body: some View {
        
        NavigationStack {
            List {
                
                HStack {
                    Image(systemName: "bell.circle")
                    NavigationLink("Notification", destination: NotificationView())
                }
                
                HStack {
                    Image(systemName: "person.text.rectangle")
                    NavigationLink("User", destination: UserView())
                }
                
                HStack {
                    Image(systemName: "lock")
                    NavigationLink("Datenschutz", destination: DatenschutzView())
                }
                
                HStack {
                    Image(systemName: "person.circle")
                    NavigationLink("Account", destination: AccountView())
                }
                
            }//List-Klammer
            .navigationTitle("Settings")
            .environmentObject(authViewModel)
            .environmentObject(settingViewModel)
        }//NavStack-Klammer
        
        
    }
}

#Preview {
    SettingMainView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
}
