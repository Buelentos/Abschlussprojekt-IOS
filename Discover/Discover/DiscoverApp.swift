

import SwiftUI
import Firebase

@main
struct DiscoverApp: App {
    @StateObject var authViewModel = AuthentifikationViewModel()
    @StateObject var discoverViewModel = DiscoverViewModel()
    @StateObject var searchViewModel = SearchViewModel()
    
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.userIsLoggedIn {
                MainTabView()
                    .environmentObject(authViewModel)
                    .environmentObject(SettingViewModel(authViewModel: authViewModel))
                    .environmentObject(ProfileViewModel(authViewModel: authViewModel))
                    .environmentObject(discoverViewModel)
                    .environmentObject(searchViewModel)
            } else {
                SplashScreen()
                    .environmentObject(authViewModel)
            }
        }
    }
}
