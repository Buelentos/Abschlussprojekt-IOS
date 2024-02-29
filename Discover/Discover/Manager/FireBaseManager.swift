//
//  FireBaseManager.swift
//  Discover
//
//  Created by Bülent Yavuz on 29.02.24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FireBaseManager {
    static let sharedFireBase = FireBaseManager()
    
    let authenticator = Auth.auth()
    let fireStore = Firestore.firestore()
    
    var userId: String? {
        authenticator.currentUser?.uid
    }
}

