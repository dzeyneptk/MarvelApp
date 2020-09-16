//
//  Data.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct DataModel : Codable {
    let offset : Int?
    let limit : Int?
    let count : Int?
    let characterResults : [CharacterResults]?

    enum CodingKeys: String, CodingKey {

        case offset = "offset"
        case limit = "limit"
        case count = "count"
        case characterResults = "results"
    }
}
