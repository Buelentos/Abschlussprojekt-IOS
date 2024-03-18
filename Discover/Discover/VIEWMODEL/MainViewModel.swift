//
//  MainViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 18.03.24.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore


class MainViewModel: ObservableObject{
    
    @Published var pictureTAG = ""
    @Published var pictureBeschreibung = ""
    @Published var pictureSheetShow = false
    @Published var repo = Repository.sharedRepo
    @Published var showFilter = false
    private var manager = FireBaseManager.sharedFireBase
    @Published var user: FireUser?
    
    
    @Published var selectedPhotosPickerItem: PhotosPickerItem? {
        didSet { Task {try await loadImage() } }
    }
    
    @Published var profileImage: UIImage?
    @MainActor
    func loadImage() async throws {
        guard let item = selectedPhotosPickerItem else {return}
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profileImage = uiImage
    }
    
    func selectedPicturetoStorage(){
        guard let uid = FireBaseManager.sharedFireBase.authenticator.currentUser?.uid else {return}
        let ref = Storage.storage().reference().child(uid).child("\(pictureTAG)")
        
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        guard let imageData = self.profileImage?.jpegData(compressionQuality: 0.5) else {return}
        
        ref.putData(imageData, metadata: metadata) { metadata, error in
            if let error = error {
                print("Failed to push Image to Storage: \(error)")
                return
            }
            ref.downloadURL { url, error in
                if let error = error {
                    print("Failed to download URL from Storage: \(error)")
                    return
                }
                if let downloadURL = url {
                    self.updateUserProfileImageURL(downloadURL)
                    print("Succesfully pushed Image to Storage")
                }
            }
        }
    }
    
    private func updateUserProfileImageURL(_ url: URL) {
        guard let userId = FireBaseManager.sharedFireBase.authenticator.currentUser?.uid else { return }
        let userRef = FireBaseManager.sharedFireBase.fireStore.collection("users").document(userId)

        // Fügen Sie das URL-String-Objekt zum Array hinzu
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if var uploadedPictures = document.data()?["uploadedPictures"] as? [String] {
                    // Falls das Array bereits vorhanden ist, fügen Sie das URL-String-Objekt hinzu
                    uploadedPictures.append(url.absoluteString)
                    userRef.updateData(["uploadedPictures": uploadedPictures]) { error in
                        if let error = error {
                            print("Failed to update profile image URL: \(error)")
                        } else {
                            print("Profile image URL added successfully in FireUser.uploadedPictures")
                        }
                    }
                } else {
                    // Falls das Array nicht vorhanden ist, erstellen Sie ein neues Array mit dem URL-String-Objekt
                    userRef.updateData(["uploadedPictures": [url.absoluteString]]) { error in
                        if let error = error {
                            print("Failed to update profile image URL: \(error)")
                        } else {
                            print("Profile image URL added successfully in FireUser.uploadedPictures")
                        }
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    
    
    
  
    
    func like(bild: EinBildReihe){
        //Hier muss über den angemeldeten User eine Datenbank erstellt werden, wo alle gelikedten bilder/videos gespeichert werden.
        //Zusätzlich, muss geprüft werden, ob das Bild bereits geliked ist. Falls ja, dann muss das Bild getogglet werden auf "filed.heart" andernfalls auf "heart"
    }
    
    
    
    
    
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
        let fireUser = FireUser(
            id: id,
            email: mail,
            benutzerName: name,
            registerAt: Date(),
            beschreibung: "",
            firstLogIn: true,
            likedPictures: [String](),
            uploadedPictures: [String]()
        )
        
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
