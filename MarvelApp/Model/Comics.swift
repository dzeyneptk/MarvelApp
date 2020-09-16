//
//  Comics.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation

struct Comics : Codable {
    let items : [Items]?
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
