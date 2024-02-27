//
//  AnmeldenView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct AnmeldenPerView: View {
    var body: some View {
        
        Spacer()
        
        Button("Facebook"){
            
        }.foregroundStyle(.white).frame(width: 350, height: 50).background(.blue).cornerRadius(10)
        
        Button("Instagram"){
            
        }.foregroundStyle(.white).frame(width: 350, height: 50).background(.orange).cornerRadius(10)
        
        Button("Xing"){
            
        }.foregroundStyle(.white).frame(width: 350, height: 50).background(.gray).cornerRadius(10)
        
        Spacer()
        
        Text("DATENSCHUTZRICHTLINIEN\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.").frame(height: 130).background(.gray.opacity(0.2)).padding()
        
        Spacer()
    }
}

#Preview {
    AnmeldenPerView()
}
