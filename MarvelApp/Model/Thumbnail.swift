//
//  Thumbnail.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct Thumbnail : Codable {
    let path : String?
    let extenSion : String?

    enum CodingKeys: String, CodingKey {

        case path = "path"
        case extenSion = "extension"
    }
}
