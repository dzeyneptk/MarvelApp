//
//  Results.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct CharacterResults : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let comics : Comics?
    let thumbnail : Thumbnail?


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case thumbnail = "thumbnail"
        case comics = "comics"
    }

}
