//
//  ProfileMainView.swift
//  Discover
//
//  Created by Bülent Yavuz on 12.03.24.
//

import SwiftUI
import PhotosUI

struct ProfileMainView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        
        
        
        
        
        
        VStack{
            Text("PROFILE MAIN VIEW")
            Button("Add Picture"){
                viewModel.pictureSheetShow.toggle()
            }.background(.blue).buttonStyle(.bordered).foregroundColor(.white).cornerRadius(10.0).sheet(isPresented: $viewModel.pictureSheetShow, content: {
                AddPictureView()
            })
        }
    }
}

#Preview {
    ProfileMainView()
        .environmentObject(ProfileViewModel())
}
