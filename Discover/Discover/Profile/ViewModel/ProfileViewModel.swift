

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class ProfileViewModel: ObservableObject{
    
    @Published var pictureTAG = ""
    @Published var pictureBeschreibung = ""
    @Published var picture = ""
    @Published var userInputUserName = ""
    @Published var userInputUserDescription = ""
    @Published var pictureSheetShow = false
    @Published var showSheetUserData = false
    @Published var alertToggle = false
    @Published var sheetProfilePicture = false
    @Published var uploadURL: String?
    @Published var profileImage: UIImage?
    @Published var profilePictureImage: UIImage?
    private let repo = Repository.sharedRepo
    private var manager = FireBaseManager.sharedFireBase
    private var listener: ListenerRegistration?
    var authViewModel: AuthentifikationViewModel
    
    init(authViewModel: AuthentifikationViewModel) {
        self.authViewModel = authViewModel
    }
    
    @Published var selectedPhotosPickerItem: PhotosPickerItem? {
        didSet { Task {try await loadImage() } }
    }
    
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
        authViewModel.fetchUser(id: self.authViewModel.user?.id ?? "")
    }
    
    private func updateUserProfileImageURL(_ url: URL) {
        guard let userId = FireBaseManager.sharedFireBase.authenticator.currentUser?.uid else { return }
        let userRef = FireBaseManager.sharedFireBase.fireStore.collection("users").document(userId)
        
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if var uploadedPictures = document.data()?["uploadedPictures"] as? [String] {
                    uploadedPictures.append(url.absoluteString)
                    userRef.updateData(["uploadedPictures": uploadedPictures]) { error in
                        if let error = error {
                            print("Failed to update profile image URL: \(error)")
                        } else {
                            print("Profile image URL added successfully in FireUser.uploadedPictures")
                        }
                        self.authViewModel.fetchUser(id: self.authViewModel.user?.id ?? "")
                    }
                } else {
                    userRef.updateData(["uploadedPictures": [url.absoluteString]]) { [self] error in
                        if let error = error {
                            print("Failed to update profile image URL: \(error)")
                        } else {
                            print("Profile image URL added successfully in FireUser.uploadedPictures")
                        }
                        authViewModel.fetchUser(id: self.authViewModel.user?.id ?? "")
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
    
    func selectedProfilePictureToStorage(){
        guard let uid = FireBaseManager.sharedFireBase.authenticator.currentUser?.uid else {return}
        let ref = Storage.storage().reference().child(uid).child("profilePicture")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        guard let imageData = self.profilePictureImage?.jpegData(compressionQuality: 0.5) else {return}
        
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
                    self.updateUserProfileImage(downloadURL)
                    print("Succesfully pushed Image to Storage")
                }
            }
        }
    }
    
    private func updateUserProfileImage(_ url: URL) {
        guard let userId = FireBaseManager.sharedFireBase.authenticator.currentUser?.uid else { return }
        let userRef = FireBaseManager.sharedFireBase.fireStore.collection("users").document(userId)
        
        userRef.updateData(["profilePicture": url.absoluteString]) { error in
            if let error = error {
                print("Failed to update profile image URL: \(error)")
            } else {
                print("Profile image URL updated successfully.")
            }
        }
    }
    
    @Published var selectedPhotosPickerItem2: PhotosPickerItem? {
        didSet { Task {try await loadImage2() } }
    }
    
    @MainActor
    func loadImage2() async throws {
        guard let item = selectedPhotosPickerItem2 else {return}
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profilePictureImage = uiImage
    }
    
    func removePictureFromFireBase(pictureToRemove: String, completion: @escaping (Error?) -> Void) {
        guard let uid = authViewModel.user?.id else {
            completion(nil)
            return
        }
        Firestore.firestore().collection("users").document(uid).updateData([
            "uploadedPictures": FieldValue.arrayRemove([pictureToRemove])
        ]) { error in
            self.removePictureFromStorage(picture: pictureToRemove)
            completion(error)
        }
        Firestore.firestore().collection("posts").getDocuments { snapshot, error in
            do {
                let pictureId =
                try  snapshot?.documents.map{ doc in
                    try doc.data(as: FirePost.self)
                }.first(where: { post in
                    post.url == pictureToRemove
                })?.id
                if pictureId != nil {
                    Firestore.firestore().collection("posts").document(pictureId ?? "").delete()
                }
            }catch{}
        }
    }
    
    func removePictureFromStorage(picture: String){
        Storage.storage().reference(forURL: picture).delete(){e in}
    }
    
    func userDetailsUpdate(){
        authViewModel.user?.benutzerName = userInputUserName
        authViewModel.user?.beschreibung = userInputUserDescription
    }
}

