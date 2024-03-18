//
//  MainTabView.swift
//  Swift_TA_TabView
//
//  Created by Brian Moyou on 07.07.23.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selcetedTab = 2
    
    var body: some View {
        TabView(selection: $selcetedTab) {
            NavigationStack{
                ABMELDEBUTTON()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
                
            }
            .tag(0)

            
            
            
            NavigationStack{
                SearchMainView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
                
            }
            .tag(1)

            
            
            
            NavigationStack{
                DiscoverView()
            }
            .tabItem {
                Image(systemName: "globe.americas.fill")
                Text("Discover")
            }
            .tag(2)
            
            
            
            NavigationStack{
                MessagesMainView()
            }
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
            .environmentObject(MainViewModel())
    }
}
