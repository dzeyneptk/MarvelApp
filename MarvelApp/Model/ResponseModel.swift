//
//  ResponseModel.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct ResponseModel : Codable {
    let data : DataModel?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
