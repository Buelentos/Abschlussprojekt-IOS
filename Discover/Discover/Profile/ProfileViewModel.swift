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
    
        
        userRef.updateData(["uploadedPictures": url.absoluteString]) { error in
          if let error = error {
            print("Failed to update profile image URL: \(error)")
          } else {
            print("Profile image-URL added successfully in FireUser.uploadedPictures")
          }
        }
      }
    
}
