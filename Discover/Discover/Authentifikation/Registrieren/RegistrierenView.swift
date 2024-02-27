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
                //PseudoCode =>
                // if liste der registrietenUserListe.Contains(User){
                //  TOAST -> Deine Registrierung war erfolgreich
                //  Weiterleitung auf den Homescreen der App
                //  }
            }.padding().background(.blue).cornerRadius(15).foregroundColor(.white)
            
            Spacer()
            
            Text("DATENSCHUTZRICHTLINIEN\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.").frame(height: 130).background(.gray.opacity(0.2)).padding()
            
            Spacer()

            
        }
    }
}

#Preview {
    RegistrierenView().environmentObject(AuthentificationViewModel())
}
