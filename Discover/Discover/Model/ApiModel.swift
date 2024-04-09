//
//  ApiModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 09.04.24.
//

import Foundation


struct ApiModel: Codable {
    let places: [Place]
}
//Sobald eine API gefunden wurde, muss abgeglichen werden, wie die antwort auf die anfrage eines APICALLS aussieht und aufgebaut ist.
//Dem entsprechend können die Structs aufgebaut werden.


struct Place: Codable{
    var title: String
    var description: String
    var urlToImage: URL?
    var destination: String
    var opens: String
    var rating: String
    var category: String
 //Die eigenschaften müssen so benannt werden, wie sie in der JSON auch benannt sind
}
