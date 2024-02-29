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
                DiscoverView()
            }
            .tabItem { Image(systemName: "calendar") }
            
            
            
            
            
            NavigationStack{
                SplashScreen()
            }
            .tabItem {Image(systemName: "person")}
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
