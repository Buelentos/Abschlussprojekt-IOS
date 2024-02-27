//
//  AuthentificationViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation

class AuthentificationViewModel: ObservableObject{
    
    @Published var emailAdress: String = ""
    @Published var benutzername: String = ""
    @Published var password: String = ""
    @Published var zeigeButtons: Bool = false
    
}
