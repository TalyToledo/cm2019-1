//
//  SongModel.swift
//  LabTunes
//
//  Created by Usuario invitado on 11/21/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation

struct Song: Codable {
    var artist: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case name = "trackName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
    }
}

struct Songs: Codable {
    var results: [Song]
}
