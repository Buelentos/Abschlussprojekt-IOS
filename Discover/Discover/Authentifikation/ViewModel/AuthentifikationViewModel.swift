//
//  AuthentifikationViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 26.03.24.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthentifikationViewModel: ObservableObject {
    
    private let repo = Repository.sharedRepo
    @Published var mail = ""
    @Published var password = ""
    @Published var benutzername = ""
    @Published var istAngemeldet = false
    @Published var user: FireUser?
    private var manager = FireBaseManager.sharedFireBase
    
    
    
    init() {
        self.checkLogin()
    }
    
    
    var userIsLoggedIn: Bool {
        self.user != nil
    }
    
    
    func fetchUser(id: String) {
        manager.fireStore.collection("users").document(id).getDocument { userInFire, error in
            if let error = error {
                print("Error reading user with id \(id): \(error)")
                return
            }
            
            guard let userInFire = userInFire else {
                print("Document with id \(id) is empty")
                return
            }
            
            do {
                let tempUser = try userInFire.data(as: FireUser.self)
                self.user = tempUser
            } catch {
                print("Decoding user failed with error: \(error)")
            }
        }
    }
    
    private func checkLogin() {
        guard let currentUser = manager.authenticator.currentUser else {
            print("user not logged in")
            return
        }
        
        self.fetchUser(id: currentUser.uid)
    }
    
    
    func login() {
        manager.authenticator.signIn(withEmail: self.mail, password: self.password) { authResult, error in
            if let userAuth = self.handleAuthResult(authResult: authResult, error: error){
                self.fetchUser(id: userAuth.uid)
            }
        }
    }
    
    func register() {
        manager.authenticator.createUser(withEmail: self.mail, password: self.password) { authResult, error in
            if let userAuth = self.handleAuthResult(authResult: authResult, error: error){
                self.createUserFireStore(id: userAuth.uid, mail: self.mail, name: self.benutzername)
                self.fetchUser(id: userAuth.uid)
            }
        }
    }
    
    private func handleAuthResult(authResult: AuthDataResult?, error: Error?) -> User? {
        if let error {
            print("error singing in: \(error)")
            return nil
        }
        
        guard let authResult else {
            print("auth result is empty!")
            return nil
        }
        
        return authResult.user
    }
    
    func createUserFireStore(id: String, mail: String, name: String) {
        let fireUser = FireUser(
            id: id,
            email: mail,
            benutzerName: name,
            registerAt: Date(),
            beschreibung: "",
            firstLogIn: true,
            likedPictures: [String](),
            uploadedPictures: [String](),
            profilePicture: ""
        )
        
        do{
            try manager.fireStore.collection("users").document(id).setData(from: fireUser)
        }catch{
            print("Fehler beim erstellen: \(error)")
        }
    }
    
    
    func logout() {
        do {
            try manager.authenticator.signOut()
            self.user = nil
        } catch {
            print("error singing out: \(error)")
        }
    }
    
}
