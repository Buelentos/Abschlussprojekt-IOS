//
//  UserView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    var body: some View {
        Text("USERVIEW!")
    }
}
#Preview {
    UserView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
}
