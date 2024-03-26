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
        Button("ABMELDEN"){
            authViewModel.logout()
            settingViewModel.removeListener()
        }
    }
}

#Preview {
    SettingMainView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()
                                           ))
}
