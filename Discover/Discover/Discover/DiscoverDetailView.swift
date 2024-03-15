//
//  DiscoverDetailView.swift
//  Discover
//
//  Created by Bülent Yavuz on 15.03.24.
//

import SwiftUI

struct DiscoverDetailView: View {
    
    var body: some View {
        
        ScrollView{
            VStack{
                
                Text("TAG des Users, welches er beim Hochladen eingegeben hat.")
                
                Image(systemName: "globe")
                    .resizable().frame(width: 200, height: 200).scaledToFit()
                
                HStack{
                    Image(systemName: "heart")
                    Image(systemName: "text.bubble")
                    Spacer()
                    Image(systemName: "paperplane")
                    Image(systemName: "bookmark").padding(.trailing)
                    
                }.padding(.top).padding(.leading)
                
                Text("BILD/VIDEO BESCHREIBUNG \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.").padding()
                
            }
        }//ScrollViewKlammer
    }
}

#Preview {
    DiscoverDetailView()
}
