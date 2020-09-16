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
    var data : DataVM? {
        guard let response = responseModel else { return nil }
        return DataVM(model: response.data)
    }
}

struct DataVM {
    private var responseModel: DataModel?
    init(model: DataModel?) {
        self.responseModel = model
    }
    var offset : Int {
        return responseModel?.offset ?? 0
    }
    var limit : Int {
        return responseModel?.limit ?? 0
    }
    var count : Int {
        return responseModel?.count ?? 0
    }
    func results(index: Int) -> ResultsVM?  {
        guard let response = responseModel else { return nil }
        return ResultsVM(model: response.characterResults?[index])
    }
}

struct ResultsVM {
    private var responseModel: CharacterResults?
    init(model: CharacterResults?) {
        self.responseModel = model
    }
    
    var id : Int {
        return responseModel?.id ?? 0
    }
    var name : String {
        return responseModel?.name ?? ""
    }
    var description : String {
        return responseModel?.description ?? ""
    }
    var comics: ComicsVM? {
        guard let response = responseModel else { return nil }
        return ComicsVM(model: response.comics)
    }
    var thumbnail: ThumbnailVM? {
        guard let response = responseModel else { return nil }
        return ThumbnailVM(model: response.thumbnail)
    }
}

struct ThumbnailVM {
    private var responseModel: Thumbnail?
    init(model: Thumbnail?) {
        self.responseModel = model
    }
    var path : String? {
        return responseModel?.path
    }
    var extenSion : String? {
        return responseModel?.extenSion
    }
}

struct ComicsVM {
    private var responseModel: Comics?
    init(model: Comics?) {
        self.responseModel = model
    }
    func items(index: Int) -> ItemsVM? {
        guard let response = responseModel else { return nil }
        return ItemsVM(model: response.items?[index])
    }
}

struct ItemsVM {
    private var responseModel: Items?
    init(model: Items?) {
        self.responseModel = model
    }
    var name : String? {
        return responseModel?.name ?? ""
    }
}
