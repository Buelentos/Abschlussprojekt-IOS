//
//  RegistrierenView.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import SwiftUI

struct RegistrierenView: View {
    @EnvironmentObject private var viewModel: AuthentificationViewModel
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Registrieren").foregroundStyle(.black)
                Spacer()
            }
            
            
            TextField("Email-Addresse", text: $viewModel.emailAdress)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
            
            TextField("Benutzername", text: $viewModel.benutzername)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
            
            SecureField("Passwort", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Registrieren") {
                //Noch keine Funktion für den Button
            }.padding().background(.blue).cornerRadius(15).foregroundColor(.white)
            
            Spacer()
            Spacer()

            
        }
    }
}

#Preview {
    RegistrierenView().environmentObject(AuthentificationViewModel())
}
