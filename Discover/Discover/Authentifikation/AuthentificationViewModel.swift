//
//  AuthentificationViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
import FirebaseAuth

class AuthentificationViewModel: ObservableObject{
    
    @Published var repo = Repository.sharedRepo
    
    private var manager = FireBaseManager.sharedFireBase
    
    @Published var user: FireUser?
    
    
    
    var userIsLoggedIn: Bool {
        self.user != nil
    }
    
    
    init() {
        self.checkLogin()
    }
    
    func login() {
        manager.authenticator.signIn(withEmail: repo.emailAdress, password: repo.password) { authResult, error in
           if let userAuth = self.handleAuthResult(authResult: authResult, error: error){
                self.fetchUser(id: userAuth.uid)
            }
        }
    }
    
    func register() {
        manager.authenticator.createUser(withEmail: repo.emailAdress, password: repo.password) { authResult, error in
           if let userAuth = self.handleAuthResult(authResult: authResult, error: error){
               self.createUserFireStore(id: userAuth.uid, mail: self.repo.emailAdress, name: self.repo.benutzername)
               self.fetchUser(id: userAuth.uid)
            }
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
    
    private func checkLogin() {
        guard let currentUser = manager.authenticator.currentUser else {
            print("user not logged in")
            return
        }
        
        self.fetchUser(id: currentUser.uid)
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
    
    
    func delete (){
        
        let fisch = manager.authenticator.currentUser
        manager.authenticator.currentUser?.delete()
        self.user = nil
        
        
        manager.fireStore.collection("users").document(fisch!.uid).delete { error in
                    if let error = error {
                        print("Error deleting user with id \(fisch!.uid): \(error)")
                    } else {
                        print("User with id \(fisch!.uid) deleted from Firestore")
                    }
                }
            }
         
     
    
    
    func createUserFireStore(id: String, mail: String, name: String) {
        let fireUser = FireUser(id: id, email: mail, benutzerName: name, registerAt: Date())
        
        do{
            try manager.fireStore.collection("users").document(id).setData(from: fireUser)
        }catch{
            print("Fehler beim erstellen: \(error)")
        }
    }
    
    
    func fetchUser(id: String){
        manager.fireStore.collection("users").document(id).getDocument { userInFire, error in
            if let error {
                print("Error reading user with id \(id): \(error)")
                return
            }
            guard let userInFire else {
                print("Document with id \(id) is empty")
                return
            }
            do{
                let tempUser = try userInFire.data(as: FireUser.self)
                self.user = tempUser
            } catch {
                 print("Decoding user failed with error: \(error)")
            }

        }
        
    }
}
