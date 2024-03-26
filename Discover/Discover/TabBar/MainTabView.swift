
import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var authViewModel: AuthentifikationViewModel
    @StateObject var discoverViewModel = DiscoverViewModel()
    @State private var selcetedTab = 2
    
    var body: some View {
        
        @StateObject var settingViewModel = SettingViewModel(authViewModel: authViewModel)
        
        TabView(selection: $selcetedTab) {

            SettingMainView()
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
                
            }
            .tag(0)

            
            
            
                SearchMainView()
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
                
            }
            .tag(1)

            
            
            
                DiscoverView()
            .tabItem {
                Image(systemName: "globe.americas.fill")
                Text("Discover")
            }
            .tag(2)
            
            
            
                MessagesMainView()
            .tabItem {
                Image(systemName: "message")
                Text("Messages")
                
            }
            .tag(3)

            
            
            NavigationStack{
                ProfileMainView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
                
            }
            .tag(4)

        }
        .environmentObject(authViewModel)
        .environmentObject(settingViewModel)
        .environmentObject(discoverViewModel)

    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(MainViewModel())
            .environmentObject(AuthentifikationViewModel())
            .environmentObject(DiscoverViewModel())
    }
}
