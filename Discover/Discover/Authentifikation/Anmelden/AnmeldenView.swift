
import SwiftUI

struct AnmeldenView: View {
    @EnvironmentObject private var authViewModel: AuthentifikationViewModel
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image(.logo)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .opacity(0.8)
                
                
                
                VStack{
                    Spacer()
                    Spacer()
                    
                    TextField("Email-Addresse", text: $authViewModel.mail)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding(.leading)
                        .padding(.trailing)
                    
                    SecureField("Passwort", text: $authViewModel.password)
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
                    NavigationLink(destination: RegistrierenView()){
                        
                        Text("Registrieren").foregroundColor(.white)
                        
                    }.frame(width: 350, height: 50).background(.yellow).cornerRadius(10)
                    
                    
                    Spacer()
                    
                    
                    Text("DATENSCHUTZRICHTLINIEN\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
                        .frame(height: 130).background(.gray.opacity(0.2)).padding()
                    
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

#Preview {
    AnmeldenView()
        .environmentObject(AuthentifikationViewModel())
    
}
