
import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var authViewModel: AuthentifikationViewModel
    @StateObject var discoverViewModel = DiscoverViewModel()
    @EnvironmentObject var settingViewModel: SettingViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    @State private var selcetedTab = 2
    
    var body: some View {
        
        
        
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
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(AuthentifikationViewModel())
            .environmentObject(DiscoverViewModel())
            .environmentObject(SettingViewModel(authViewModel: AuthentifikationViewModel()))
            .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
    }
}
