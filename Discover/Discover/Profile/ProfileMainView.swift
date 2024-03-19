//
//  ProfileMainView.swift
//  Discover
//
//  Created by Bülent Yavuz on 12.03.24.
//

import SwiftUI
import PhotosUI

struct ProfileMainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    
    var querreihe = 0
    var verticalreihe = 0
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "globe")
                    .resizable().frame(width: 90,height:90).clipShape(Circle()).border(.blue).padding()
                VStack{
                    Text(viewModel.user?.benutzerName ?? "lala")
                    HStack {
                        Text("Member since:")
                      
                    }
                }
                Spacer()
            }
            HStack {
                Text(viewModel.user?.beschreibung ?? "Keine Beschreibung").padding()
                Spacer()
                Button("Add Picture"){
                    viewModel.pictureSheetShow.toggle()
                }
                .background(.blue).buttonStyle(.bordered).foregroundColor(.white).cornerRadius(10.0).padding().sheet(isPresented: $viewModel.pictureSheetShow, content: {
                    AddPictureView()
                })
            }
        }
        NavigationStack{
            ScrollView{
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.user?.uploadedPictures ?? [""], id: \.self){ picture in
                        
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
                            )
                        }
                }
                
                
                
                
                
            }//ScrollViewKlammer
        }
    }
}

#Preview {
    ProfileMainView()
        .environmentObject(MainViewModel())
}
