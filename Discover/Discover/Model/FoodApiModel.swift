//
//  ApiModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 09.04.24.
//

import Foundation


struct FoodApiModel: Codable {
    var businesses: [FoodPlace]
}

struct FoodPlace: Codable{
    var name: String?
    var image_url: URL?
    var location: Location?
    var rating: Double?
}

struct Location: Codable{
    var display_address: [String]
}

