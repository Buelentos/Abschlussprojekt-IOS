//
//  SplashScreen.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive: Bool = false

    var body: some View {
        
        VStack{
            if (self.isActive){
                AnmeldenView()
            }else {
                Text("SPLASHSCREEN")
                Image(.logo)
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                withAnimation{
                    isActive = true
                }
            }
        }
        
    }//BodyKlammer
}//StructKlammer

#Preview {
        
        SplashScreen()
        .environmentObject(MainViewModel())
            
    }

