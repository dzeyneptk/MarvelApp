//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 15.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    var requestMethod: HTTPMethod = .get
    
    func fetchService(request: RequestModel, complationHandler: @escaping (ResponseModel?, Error?) -> Void ) {
        guard let url = URL(string: AppConstant.apiUrl) else {return}
        
        ActivityIndicator.shared.showIndicator()
        
        AF.request(url, method: requestMethod, parameters: request.convertToDict(), encoding: URLEncoding(destination: .queryString), headers: nil)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let model =  try JSONDecoder().decode(ResponseModel.self, from: data)
                        ActivityIndicator.shared.stopIndicator()
                        complationHandler(model, nil)
                        
                    } catch let error {
                        ActivityIndicator.shared.stopIndicator()
                        complationHandler(nil, error)
                    }
                case .failure(let error):
                    ActivityIndicator.shared.stopIndicator()
                    complationHandler(nil, error)
                }
        }
    }
}
