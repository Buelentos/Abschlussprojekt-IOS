//
//  SettingViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 26.03.24.
//

import Foundation

class SettingViewModel: ObservableObject{
    
    var authViewModel: AuthentifikationViewModel
    private var manager = FireBaseManager.sharedFireBase

    init(authViewModel: AuthentifikationViewModel) {
        self.authViewModel = authViewModel
    }
    
    func delete (){
        
        let currentUser = manager.authenticator.currentUser
        manager.authenticator.currentUser?.delete()
        authViewModel.user = nil
        
        
        manager.fireStore.collection("users").document(currentUser!.uid).delete { error in
            if let error = error {
                print("Error deleting user with id \(currentUser!.uid): \(error)")
            } else {
                print("User with id \(currentUser!.uid) deleted from Firestore")
            }
        }
    }
    
    
    func removeListener(){
        authViewModel.listener = nil
        authViewModel.user = nil
    }
}
