//
//  EventAPIModel.swift
//  Discover
//
//  Created by Bülent Yavuz on 22.04.24.
//

import Foundation

struct EventAPIModel: Codable{
    var events: [Event]
}

struct Event: Codable{
    var name: String?
    var image_url: URL?
    var location: EventLocation?
    var description: String?
}

struct EventLocation: Codable{
    var display_address: [String]
}
