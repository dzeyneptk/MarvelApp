//
//  Items.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct Items : Codable {
    let name : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
