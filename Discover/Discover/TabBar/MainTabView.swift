//
//  MainTabView.swift
//  Swift_TA_TabView
//
//  Created by Brian Moyou on 07.07.23.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selcetedTab = 1
    
    var body: some View {
        TabView(selection: $selcetedTab) {
            NavigationStack{
                ABMELDEBUTTON()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
                
            }
            
            
            
            NavigationStack{
                SearchMainView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
                
            }
            
            
            
            NavigationStack{
                DiscoverView()
            }
            .tabItem {
                Image(systemName: "globe.americas.fill")
                Text("Discover")
            }
            .tag(1)
            
            
            
            NavigationStack{
                MessagesMainView()
            }
            .tabItem {
                Image(systemName: "message")
                Text("Messages")
                
            }
            
            
            
            NavigationStack{
                ProfileMainView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
                
            }
            
            
            
        }
        
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(AuthentificationViewModel())
            .environmentObject(DiscoverViewModel())
    }
}
