

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
    }

