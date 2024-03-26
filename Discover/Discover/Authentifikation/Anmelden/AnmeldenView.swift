//
//  WillkommenView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct AnmeldenView: View {
    @EnvironmentObject private var viewModel: MainViewModel
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    

    var body: some View {
        NavigationStack{
            Image(.logo).resizable().frame(width: 150, height: 150).padding(.top)
            Text("DISCOVER").foregroundStyle(.blue).bold().padding(.bottom)
            
            
            
            
            TextField("Email-Addresse", text: $viewModel.repo.emailAdress)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.leading)
                .padding(.trailing)
            
            SecureField("Passwort", text: $viewModel.repo.password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            
            Button("Anmelden"){
                authViewModel.login()
            }.foregroundStyle(.white).frame(width: 350, height: 50).background(.blue).cornerRadius(10)
                .padding()
            
            
            Divider().padding(.horizontal)
            
            
                
            
            
            NavigationLink(destination: AnmeldenPerView()){
                    
                    Text("Per Socialmedia anmelden").foregroundColor(.white)
                
            }.frame(width: 350, height: 50).background(.orange).cornerRadius(10)

            
            
            
            
            Divider().padding(.horizontal)
                .padding(.bottom)
            
            
            Text("Wenn du noch kein Mitglied bist")
            NavigationLink(destination: RegistrierenView().environmentObject(authViewModel)
            ){
                    
                    Text("Registrieren").foregroundColor(.white)
                
            }.frame(width: 350, height: 50).background(.yellow).cornerRadius(10)
            
            
            Spacer()
            
            
            Text("DATENSCHUTZRICHTLINIEN\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.").frame(height: 130).background(.gray.opacity(0.2)).padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    AnmeldenView()
        .environmentObject(MainViewModel())
        .environmentObject(AuthentifikationViewModel())

}
