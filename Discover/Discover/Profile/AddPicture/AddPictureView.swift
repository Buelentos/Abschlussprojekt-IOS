//
//  AddPictureView.swift
//  Discover
//
//  Created by Bülent Yavuz on 15.03.24.
//

import SwiftUI
import PhotosUI


struct AddPictureView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    var body: some View {
        
        VStack{
            
            Spacer()
            Text("Add Picture")
            Spacer()
            
            PhotosPicker(selection: $profileViewModel.selectedPhotosPickerItem, label: {
                if let profileImage = profileViewModel.profileImage {
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
            
            TextField("Gebe hier deinen Bild-Hashtag ein", text: $profileViewModel.pictureTAG).padding().frame(width: 300)
            
            TextField("Gebe hier deine Bildbeschreibung ein", text: $profileViewModel.pictureBeschreibung).padding().frame(width: 350)
            
            Button("Neues Foto Hochladen"){
                profileViewModel.selectedPicturetoStorage()
                if profileViewModel.pictureBeschreibung.isEmpty{
                    profileViewModel.pictureBeschreibung = "Keine Beschreibung"
                }
                profileViewModel.resetPictureSelections()
                profileViewModel.pictureSheetShow.toggle()
            }.background(.blue).buttonStyle(.bordered).foregroundColor(.white).cornerRadius(10.0).disabled(profileViewModel.pictureTAG.isEmpty)
            Spacer()
        }
    }
}

#Preview {
    AddPictureView()
        .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
}
