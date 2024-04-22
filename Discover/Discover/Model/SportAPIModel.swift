//
//  SportAPIModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 22.04.24.
//

import Foundation

struct SportAPIModel: Codable{
    
    var businesses: [Sport]
}


struct Sport: Codable{
    var name: String?
    var image_url: URL?
    var location: SportLocation?
    var rating: Double?
}

struct SportLocation: Codable{
    var display_address: [String]
}
