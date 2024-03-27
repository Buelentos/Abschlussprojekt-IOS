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
    let picture: String
    let title: String
    let description: String
    let destination: String
    let opens: String
    let rating: String
    
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(title)
        }
    
}
