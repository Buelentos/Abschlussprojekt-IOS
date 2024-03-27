//
//  EinBildReihe.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.02.24.
//

import Foundation
import SwiftUI

struct FirePost: Identifiable, Hashable, Codable{
    
    var id: String
    var url: String
    var tag: String 
    var beschreibung: String
    var likes: Int
    var comments: [String]
    
}



