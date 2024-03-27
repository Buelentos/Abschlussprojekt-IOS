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
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var querreihe = 0
    var verticalreihe = 0
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "globe")
                    .resizable().frame(width: 90,height:90).clipShape(Circle()).border(.blue).padding()
                VStack{
                    Text(authViewModel.user?.benutzerName ?? "lala")
                    HStack {
                        Text("Member since: \(String(describing: authViewModel.user?.registerAt.formatted()))")
                        
                    }
                }
                Spacer()
            }
            HStack {
                Text(authViewModel.user?.beschreibung ?? "Keine Beschreibung").padding()
                Spacer()
                Button("Add Picture"){
                    profileViewModel.pictureSheetShow.toggle()
                }
                .background(.blue).buttonStyle(.bordered).foregroundColor(.white).cornerRadius(10.0).padding().sheet(isPresented: $profileViewModel.pictureSheetShow, content: {
                    AddPictureView()
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
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 130, maxHeight: 130)
                                    .scaledToFill()
                            },
                            placeholder: {
                                ProgressView()
                            }
                        ).background(.gray.opacity(0.2))
                    }
                }
                
                
                
                
                
            }//ScrollViewKlammer
        }
    }
}

#Preview {
    ProfileMainView()
        .environmentObject(ProfileViewModel(authViewModel: AuthentifikationViewModel()))
        .environmentObject(AuthentifikationViewModel())
}
