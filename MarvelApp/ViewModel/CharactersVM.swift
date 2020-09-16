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
    private var result: [String] = []
    
    private var imageResult: UIImage? = nil
    weak var delegate: CharactersDelegate?
    
    // MARK: - MarvelAPIService
    func getCharacterName() {
        
        let requestParameter = RequestModel(limit: 0, offSet: 30)
       // ActivityIndicator.shared.showIndicator()
        NetworkManager.shared.fetchService(request: requestParameter) { (response, error) in
            if let error = error {
              //  ActivityIndicator.shared.stopIndicator()
                self.delegate?.failWith(error: error.localizedDescription)
                return
            }
            if let response = response {
              //  ActivityIndicator.shared.stopIndicator()
                self.responseModel = response
                self.prepareData()
                self.delegate?.succes()
            }
        }
    }
    
    // MARK: - Image Fetch Service
    func getImage(position: Int) {
        // nil control

        let url = responseModel?.data?.results?[position].resourceURI ?? ""
        NetworkManager.shared.fetchImage(imageUrl: url)  { (image, error) in
        if let error = error {
            self.delegate?.failWith(error: error.localizedDescription)
            return
        }
            if let image = image {
                self.imageResult = image
                self.delegate?.succes()
            }
        }
    }
    
    // MARK: - Private Func
    private func prepareData() {
        result.removeAll()
        result.append("Character Name: " + (responseModel?.data?.results?[0].name ?? "") )
     
    }
    
    // MARK: - COmputed Proporties
    var image: UIImage? {
        return imageResult
    }
    
    var posterURI: String? {
        return ResponseVM(model: responseModel).data?.results?.resourceURI
    }
}
