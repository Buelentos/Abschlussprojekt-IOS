//
//  DiscoverApp.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

@main
struct DiscoverApp: App {
    @StateObject var viewmodel = AuthentificationViewModel()
    
    var body: some Scene {
        WindowGroup {
            RegistrierenView()
                .environmentObject(viewmodel)
        }
    }
}
