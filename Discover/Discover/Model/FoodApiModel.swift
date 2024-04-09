//
//  ApiModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 09.04.24.
//

import Foundation


struct FoodApiModel: Codable {
    let foodplaces: [FoodPlace]
}
//Sobald eine API gefunden wurde, muss abgeglichen werden, wie die antwort auf die anfrage eines APICALLS aussieht und aufgebaut ist.
//Dem entsprechend können die Structs aufgebaut werden.


struct FoodPlace: Codable{
    var name: String
    var image_url: URL?
    var location: Location
    var rating: String
 //Die eigenschaften müssen so benannt werden, wie sie in der JSON auch benannt sind
}

struct Location: Codable{
    var display_address: [String]
}

