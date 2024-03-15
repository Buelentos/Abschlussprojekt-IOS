//
//  ProfileViewModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 13.03.24.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class ProfileViewModel: ObservableObject{
    @Published var pictureTAG = ""
    @Published var pictureBeschreibung = ""
    @Published var pictureSheetShow = false
    
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

    
}
