//
//  ResponseVM.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
struct ResponseVM {
    private var responseModel : ResponseModel?
    
    init(model: ResponseModel?) {
        self.responseModel = model
    }
    var code : Int? {
        return responseModel?.code ?? 0
    }
    var status : String? {
        return responseModel?.status ?? ""
    }
    var copyright : String? {
        return responseModel?.copyright ?? ""
    }
    var attributionText : String? {
        return responseModel?.attributionText ?? ""
    }
    var attributionHTML : String? {
        return responseModel?.attributionHTML ?? ""
    }
    var etag : String? {
        return responseModel?.etag ?? ""
    }
    var data : DataVM? {
        guard let response = responseModel else { return nil }
        return DataVM(model: response.data)
    }
}

struct DataVM {
    private var responseModel: Data?
    init(model: Data?) {
        self.responseModel = model
    }
    var offset : Int? {
        return responseModel?.offset ?? 0
    }
    var limit : Int? {
        return responseModel?.limit ?? 0
    }
    var total : Int? {
        return responseModel?.total ?? 0
    }
    var count : Int? {
        return responseModel?.count ?? 0
    }
    var results : ResultsVM? {
        guard let response = responseModel else { return nil }
        return ResultsVM(model: response.results?[0])
    }
}

struct ResultsVM {
    private var responseModel: Results?
    init(model: Results?) {
        self.responseModel = model
    }
    
    var id : Int? {
        return responseModel?.id ?? 0
    }
    var name : String? {
        return responseModel?.name ?? ""
    }
    var description : String? {
        return responseModel?.description ?? ""
    }
    var modified : String? {
        return responseModel?.modified ?? ""
    }
    var resourceURI : String? {
        return responseModel?.resourceURI ?? ""
    }
    var comics: ComicsVM? {
        guard let response = responseModel else { return nil }
        return ComicsVM(model: response.comics)
    }
}

struct ComicsVM {
    private var responseModel: Comics?
    init(model: Comics?) {
        self.responseModel = model
    }
    var available : Int? {
        return responseModel?.available ?? 0
    }
    var collectionURI : String? {
        return responseModel?.collectionURI ?? ""
    }
    var returned : Int? {
        return responseModel?.returned ?? 0
    }
    var items : ItemsVM? {
        guard let response = responseModel else { return nil }
        return ItemsVM(model: response.items?[0])
    }
}

struct ItemsVM {
    private var responseModel: Items?
    init(model: Items?) {
        self.responseModel = model
    }
    var resourceURI : String? {
        return responseModel?.resourceURI ?? ""
    }
    var name : String? {
        return responseModel?.name ?? ""
    }
}
