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
    var offset: Int
    var ts: String
    var apikey: String
    var hash: String
     

    
    init(limit: Int, offSet: Int) {
        self.limit = limit
        self.offset = offSet
        self.apikey = AppConstant.apiKeyPublic
        self.ts = String(Int(Date().timeIntervalSince1970*1000))
        self.hash = (String(Int(Date().timeIntervalSince1970*1000)) + AppConstant.apiKeyPrivate + AppConstant.apiKeyPublic).md5
    }
}
