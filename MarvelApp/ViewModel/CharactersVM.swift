//
//  CharactersVM.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
import UIKit

protocol CharactersDelegate: class {
    func failWith(error: String?)
    func succes()
}

class CharactersVM {
    private var responseModel: ResponseModel?
    
    private var imageResult: UIImage? = nil
    weak var delegate: CharactersDelegate?
    
    // MARK: - MarvelAPIService
    func getCharacterName(limit: Int, offset: Int) {
        let requestParameter = RequestModel(limit: limit, offSet: offset)
        NetworkManager.shared.fetchService(request: requestParameter) { (response, error) in
            if let error = error {
                self.delegate?.failWith(error: error.localizedDescription)
                return
            }
            if let response = response {
                self.responseModel = response
                self.delegate?.succes()
            }
        }
    }
    
    // MARK: - Image Fetch Service
    func getImageUrl(index: Int) -> URL? {
        let dataVM = ResponseVM(model: responseModel).data
        guard let path = dataVM?.results(index: index)?.thumbnail?.path ,
            let ext = dataVM?.results(index: index)?.thumbnail?.extenSion
            else {return nil}
        return URL(string: path + "." + ext)
    }
    func getCharacterName(index: Int) -> String {
        let dataVM =  ResponseVM(model: responseModel).data
        let results = dataVM?.results(index: index)
        return results?.name ?? ""
    }
    
    // MARK: - Computed Proporties
    var count: Int {
        let dataVM = ResponseVM(model: responseModel).data
        return dataVM?.count ?? 0
    }
    var image: UIImage? {
        return imageResult
    }
}
