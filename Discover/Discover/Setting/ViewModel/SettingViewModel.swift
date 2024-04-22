//
//  SettingViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 26.03.24.
//

import Foundation
import FirebaseStorage
import SwiftUI
import FirebaseAuth


class SettingViewModel: ObservableObject{
    
    var authViewModel: AuthentifikationViewModel
    private var manager = FireBaseManager.sharedFireBase
    
    init(authViewModel: AuthentifikationViewModel) {
        self.authViewModel = authViewModel
    }
    
    func delete() {
        guard let currentUser = manager.authenticator.currentUser else {
            print("No current user found")
            return
        }
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        deletePosts(user: currentUser) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        deleteStorageUser(user: currentUser) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.manager.authenticator.currentUser?.delete { error in
                if let error = error {
                    print("Error deleting user: \(error)")
                } else {
                    print("User successfully deleted")
                    self.authViewModel.user = nil
                }
            }
            
            self.manager.fireStore.collection("users").document(currentUser.uid).delete { error in
                if let error = error {
                    print("Error deleting user with id \(currentUser.uid): \(error)")
                } else {
                    print("User with id \(currentUser.uid) deleted from Firestore")
                }
            }
        }
    }
    
    
    func deletePosts(user: User, completion: @escaping () -> Void){
        
        let userDocumentRef = manager.fireStore.collection("users").document(user.uid)
        
        userDocumentRef.getDocument { document, error in
            if let error = error {
                print("Error getting user with id \(user.uid): \(error)")
            } else {
                if let uploadedPictures = document?.data()?["uploadedPictures"] as? [String]{
                    if uploadedPictures != []{
                        self.manager.fireStore.collection("posts").whereField("url", in: uploadedPictures).getDocuments { (snapshot, error) in
                            guard let snapshot = snapshot else {
                                print("Error fetching documents to delete: \(error?.localizedDescription ?? "Unknown error")")
                                return
                            }
                            
                            let batch = self.manager.fireStore.batch()
                            for document in snapshot.documents {
                                batch.deleteDocument(document.reference)
                            }
                            
                            batch.commit { err in
                                if let err = err {
                                    print("Error deleting batch: \(err)")
                                } else {
                                    print("Batch delete successful.")
                                }
                                completion()
                            }
                        }
                    }else{
                        completion()
                    }
                }
            }
            
        }
        
    }
    
    func deleteStorageUser(user: User, completion: @escaping () -> Void){
        let ref = Storage.storage().reference().child(user.uid)
        ref.listAll { result, error in
            if let error = error {
                print("Error deleting storage items: \(error)")
                completion()
            } else if let result = result {
                let itemsCount = result.items.count
                if itemsCount == 0 {
                    completion()
                } else {
                    for item in result.items {
                        item.delete { error in
                            if let error = error {
                                print("Error deleting file: \(error)")
                            } else {
                                print("Deleting file successful")
                            }
                            if item == result.items.last {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func removeListener(){
        authViewModel.user = nil
    }
}
