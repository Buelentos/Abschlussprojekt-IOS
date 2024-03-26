//
//  DiscoverApp.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI
import Firebase

@main
struct DiscoverApp: App {
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var authViewModel = AuthentifikationViewModel()
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.userIsLoggedIn {
                MainTabView()
                    .environmentObject(mainViewModel)
                    .environmentObject(authViewModel)
            } else {
                SplashScreen()
                    .environmentObject(mainViewModel)
                    .environmentObject(authViewModel)
            }
        }
    }
}
