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
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if mainViewModel.userIsLoggedIn {
                MainTabView()
                    .environmentObject(mainViewModel)
            } else {
                SplashScreen()
                    .environmentObject(mainViewModel)
            }
        }
    }
}
