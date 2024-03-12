//
//  MainTabView.swift
//  Swift_TA_TabView
//
//  Created by Brian Moyou on 07.07.23.
//

import SwiftUI

struct MainTabView: View {
    
    
    var body: some View {
        TabView {
            NavigationStack{
                ABMELDEBUTTON()
            }
            .tabItem {
                HStack{
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            
            
            
            NavigationStack{
                SearchMainView()
            }
            .tabItem {
                HStack{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
        }

            
            
            NavigationStack{
                DiscoverView()
            }
            .tabItem {
                HStack{
                    Image(systemName: "globe.americas.fill")
                    Text("Discover")
            }
            }

            
            
            NavigationStack{
                MessagesMainView()
            }
            .tabItem {
                HStack{
                    Image(systemName: "message")
                    Text("Messages")
            }
            }

            
            
            NavigationStack{
                ProfileMainView()
            }
            .tabItem {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
                
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
