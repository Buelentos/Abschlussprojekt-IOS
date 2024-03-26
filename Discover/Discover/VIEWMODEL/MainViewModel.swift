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
    
    @StateObject var authViewModel = AuthentifikationViewModel()
    
    @Published var pictureTAG = ""
    @Published var pictureBeschreibung = ""
    @Published var pictureSheetShow = false
    @Published var repo = Repository.sharedRepo
    @Published var showFilter = false
    private var manager = FireBaseManager.sharedFireBase
    @Published var user: FireUser?
    @Published var listener: ListenerRegistration?
    @Published var uploadURL: String?
    
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
    
    func createPost(url: String, tag: String, beschreibung: String){
        let id = UUID().uuidString
        let firePost = FirePost(
            id: id,
            url: url,
            tag: tag,
            beschreibung: beschreibung,
            likes: 0,
            comments: [String]()
        )
        
        do{
            try manager.fireStore.collection("posts").document(id).setData(from: firePost)
        } catch {
            print("Fehler beim erstellen von einem Post: \(error)")
        }
    }
    
    func selectedPicturetoStorage(){
        guard let uid = FireBaseManager.sharedFireBase.authenticator.currentUser?.uid else {return}
        let ref = Storage.storage().reference().child(uid).child("\(pictureTAG)")
        let tag = pictureTAG
        let beschreibung = pictureBeschreibung
        
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
                    self.createPost(url: downloadURL.absoluteString, tag: tag, beschreibung: beschreibung)
                    print("Succesfully pushed Image to Storage")
                    
                }
                
            }
            
        }
        authViewModel.fetchUser(id: self.user?.id ?? "")
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
                        self.authViewModel.fetchUser(id: self.user?.id ?? "")
                    }
                } else {
                    // Falls das Array nicht vorhanden ist, erstellen Sie ein neues Array mit dem URL-String-Objekt
                    userRef.updateData(["uploadedPictures": [url.absoluteString]]) { [self] error in
                        if let error = error {
                            print("Failed to update profile image URL: \(error)")
                        } else {
                            print("Profile image URL added successfully in FireUser.uploadedPictures")
                        }
                        authViewModel.fetchUser(id: self.user?.id ?? "")
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
        uploadURL = url.absoluteString
    }
    
    
    func resetPictureSelections (){
        self.pictureTAG = ""
        self.pictureBeschreibung = ""
        self.profileImage = nil
        
    }
    
    
    
   
    
    
    
    
    
    init() {
        self.loadListInRepo()
    }
    
    
    
    
    
    
    
    func loadListInRepo(){
        self.listener = manager.fireStore.collection("posts")
            .addSnapshotListener{ post, error in
                if let error = error {
                    print("Error reading pets: \(error)")
                    return
                }
                guard let documents = post?.documents else {
                          print("Query Snapshot is empty")
                          return
                        }
                let firepost = documents.compactMap{ document in
                    try? document.data(as: FirePost.self)
                }
                self.repo.mainList = firepost

            }
    }


    
    
    
}
