//
//  ProfilePictureSelectionView.swift
//  Discover
//
//  Created by Bülent Yavuz on 28.03.24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct ProfilePictureSelectionView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("Add Profile Picture")
            Spacer()
            
            PhotosPicker(selection: $profileViewModel.selectedPhotosPickerItem2, label: {
                if let profileImage = profileViewModel.profilePictureImage {
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding()
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(Color(.systemGray))
                }
            })
            
            Button("Neues Profilfoto Speichern"){
                profileViewModel.selectedProfilePictureToStorage()
                profileViewModel.resetPictureSelections()
                profileViewModel.sheetProfilePicture.toggle()
            }.background(.blue).buttonStyle(.bordered).foregroundColor(.white).cornerRadius(10.0)            .padding()
            Spacer()
        }    }
}

#Preview {
    ProfilePictureSelectionView()
        .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
    
}
