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
    @StateObject var viewmodel = AuthentificationViewModel()
    @StateObject var testModel = DiscoverViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if viewmodel.userIsLoggedIn {
                MainTabView()
                    .environmentObject(viewmodel)
                    .environmentObject(testModel)
                    .environmentObject(profileViewModel)
            } else {
                SplashScreen()
                    .environmentObject(viewmodel)
                    .environmentObject(testModel)
            }
        }
    }
}
