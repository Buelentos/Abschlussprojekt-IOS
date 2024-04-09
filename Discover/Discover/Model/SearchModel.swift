//
//  SearchModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 27.03.24.
//

import Foundation
import SwiftUI


struct SearchModel: Identifiable, Hashable{
    
    var id: String
    var picture: String?
    var title: String
    var description: String?
    var destination: [String]
    var opens: String?
    var rating: String
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
    
}
