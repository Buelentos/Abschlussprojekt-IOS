//
//  AddPictureView.swift
//  Discover
//
//  Created by Bülent Yavuz on 15.03.24.
//

import SwiftUI
import PhotosUI


struct AddPictureView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        VStack{
            Spacer()
            Text("Add Picture")
            Spacer()
            PhotosPicker(selection: $viewModel.selectedPhotosPickerItem, label: {
                if let profileImage = viewModel.profileImage {
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(Color(.systemGray))
                }
            })
                
            TextField("Gebe hier deinen Bild-Hashtag ein", text: $viewModel.pictureTAG).padding().frame(width: 300)
            
            TextField("Gebe hier deine Bildbeschreibung ein", text: $viewModel.pictureBeschreibung).padding().frame(width: 350)
            
                Button("Neues Foto Hochladen"){
                
                    viewModel.selectedPicturetoStorage()
                    viewModel.pictureSheetShow.toggle()
                    if viewModel.pictureBeschreibung.isEmpty{
                        viewModel.pictureBeschreibung = "Keine Beschreibung"
                    }
                }.background(.blue).buttonStyle(.bordered).foregroundColor(.white).cornerRadius(10.0).disabled(viewModel.pictureTAG.isEmpty)
            Spacer()
            }
    }
}

#Preview {
    AddPictureView()
        .environmentObject(ProfileViewModel())
}
