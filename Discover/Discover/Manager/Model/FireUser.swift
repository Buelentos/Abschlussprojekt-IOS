//
//  FireUser.swift
//  Discover
//
//  Created by Bülent Yavuz on 29.02.24.
//

import Foundation

struct FireUser: Codable, Identifiable{
    var id: String
    var email: String
    var benutzerName: String
    var registerAt: Date
    var beschreibung: String?
    var firstLogIn: Bool?
    var likedPictures = [""]
    var uploadedPictures = [""]
    var profilePicture = ""
}
