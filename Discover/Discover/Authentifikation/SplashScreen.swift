

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var authViewModel: AuthentifikationViewModel
    @State private var isActive: Bool = false
    
    var body: some View {
        
        VStack{
            if (self.isActive){
                AnmeldenView()
                    .environmentObject(authViewModel)
            }else {
                Image(.logo)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                withAnimation{
                    isActive = true
                }
            }
        }
        
    }//BodyKlammer
}//StructKlammer

#Preview {
    SplashScreen()
}

