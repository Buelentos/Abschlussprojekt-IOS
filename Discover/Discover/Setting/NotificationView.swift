//
//  BenachrichtigungenView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import SwiftUI

struct NotificationView: View {
    
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    
    var body: some View {
        
        Text("Benachrichtigungen!")
        
    }
}
#Preview {
    NotificationView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
}
