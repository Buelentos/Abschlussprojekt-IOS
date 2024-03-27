//
//  DatenschutzView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import SwiftUI

struct DatenschutzView: View {
    
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    
    var body: some View {
        Text("DATENSCHUTZVIEW")
    }
}

#Preview {
    DatenschutzView()
        .environmentObject(AuthentifikationViewModel())
        .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
}
