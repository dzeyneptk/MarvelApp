//
//  RequestModel.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct RequestModel: Codable {
    var limit: Int
    var offSet: Int
    var ts: String
    var apikeypublic: String
    var hash: String
    var string = String(Date().timeIntervalSince1970*1000) + AppConstant.apiKeyPrivate + AppConstant.apiKeyPublic
    
    init(limit: Int, offSet: Int) {
        self.limit = limit
        self.offSet = offSet
        self.apikeypublic = AppConstant.apiKeyPublic
        self.ts = String(Date().timeIntervalSince1970*1000)
        self.hash = string.sha512
    }
}
