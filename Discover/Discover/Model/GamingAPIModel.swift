//
//  GamingAPIModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 23.04.24.
//

import Foundation

struct GamingAPIModel: Codable{
    
    var games: [Game]
}


struct Game: Codable{
    var title: String?
    var thumbnail: URL?
    var short_description: String?
}

