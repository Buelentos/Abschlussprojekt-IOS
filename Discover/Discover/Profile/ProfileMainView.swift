//
//  ProfileMainView.swift
//  Discover
//
//  Created by Bülent Yavuz on 12.03.24.
//

import SwiftUI
import PhotosUI

struct ProfileMainView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var authViewModel: AuthentifikationViewModel
    @EnvironmentObject var discoverViewModel: DiscoverViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var querreihe = 0
    var verticalreihe = 0
    var body: some View {
        
        VStack{
            
            HStack{
                AsyncImage(
                    url: URL(string: authViewModel.user?.profilePicture ?? "globe"),
                    content: { image in
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(15)
                    },
                    placeholder: {
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                )
                .padding(.leading)
                .padding(.top)
                .onTapGesture {
                    profileViewModel.sheetProfilePicture.toggle()
                }
                .sheet(isPresented: $profileViewModel.sheetProfilePicture, content: {
                    ProfilePictureSelectionView()
                })
                
                VStack{
                    Text(authViewModel.user?.benutzerName ?? "")
                    HStack {
                        Text("Member since: \(String(describing: authViewModel.user?.registerAt.formatted() ?? ""))")
                    }
                }
                
                Spacer()
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.orange)
                    .padding()
                    .onTapGesture {
                        profileViewModel.showSheetUserData.toggle()
                    }
            }
            HStack {
                Text(authViewModel.user?.beschreibung ?? "Keine Beschreibung").padding()
                Spacer()
                Button("Add Picture"){
                    profileViewModel.pictureSheetShow.toggle()
                }
                .background(.blue)
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .cornerRadius(10.0)
                .padding()
                .sheet(isPresented: $profileViewModel.pictureSheetShow, content: {
                    AddPictureView()
                        .environmentObject(profileViewModel)
                })
                .sheet(isPresented: $profileViewModel.showSheetUserData, content: {
                    ChangeUserDataView()
                        .environmentObject(profileViewModel)
                })
            }
        }
        
        NavigationStack{
            ScrollView{
                
                LazyVGrid(columns: columns) {
                    ForEach(authViewModel.user?.uploadedPictures ?? [""], id: \.self){ picture in
                        AsyncImage(
                            url: URL(string: picture),
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 130, maxHeight: 130)
                                    .scaledToFill()
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .background(.gray.opacity(0.2))
                        .onTapGesture{
                            print(picture)
                            profileViewModel.picture = String(picture)
                            profileViewModel.alertToggle.toggle()
                        }
                    }
                }
            }//ScrollViewKlammer
            .alert("Bild löschen?!", isPresented: $profileViewModel.alertToggle){
                
                Button("Löschen",role: .destructive){
                    profileViewModel.removePictureFromFireBase(pictureToRemove: profileViewModel.picture) { _ in
                        print(" delete succses")
                        authViewModel.user?.uploadedPictures.removeAll(where: { picture in
                            picture == profileViewModel.picture
                        })
                        discoverViewModel.mainList.removeAll(where: { picture in
                            picture.url == profileViewModel.picture
                        })
                    }
                }
                
                Button("Abbrechen", role: .cancel){}
            } message: {
                Text("Wenn sie auf ''löschen'' drücken, wird Ihr ausgewähltes Foto gelöscht.")
            }
        }
    }
}

#Preview {
    ProfileMainView()
        .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
        .environmentObject(AuthentifikationViewModel())
}
