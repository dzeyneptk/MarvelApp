//
//  HelperFunctions.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
import CommonCrypto
extension RequestModel {
    func convertToDict() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        let json = String(data: data, encoding: .utf8)
        guard let jsonData = json?.data(using: .utf8, allowLossyConversion: false) else { return [:]}
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        guard let finalDict = dict as? [String: Any] else { return [:]}
        return finalDict
    }
}
extension String {

    public var sha512: String {
        let data = self.data(using: .utf8)!
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA512($0.baseAddress, CC_LONG(data.count), &digest)
        }
        return digest.map({ String(format: "%02hhx", $0) }).joined(separator: "")
    }
}
