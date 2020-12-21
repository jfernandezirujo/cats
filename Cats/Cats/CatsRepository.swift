//
//  CatsRepository.swift
//  Cats
//
//  Created by Josefina Perez on 18/12/2020.
//  Copyright © 2020 Julieta Fer. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CatsRepository {

    static let headers: HTTPHeaders = ["x-api-key" : "6201d662-2460-47c5-a198-5b75d378eedd"]
    
    static func getCats(completionHandler: @escaping (_ cats: [Cat], _ error: Error?) -> Void) {
        
        let urlString = "https://api.thecatapi.com/v1/images/search"
        AF.request(urlString).validate().responseJSON(completionHandler: {response in
            
            if let error = response.error{
                print(error.errorDescription)
                completionHandler([], error)
            }
            
            else if let value = response.value {
                var json = JSON(value)
                var jsonCats = json.arrayValue
                var arrayCats: [Cat] = []

                for jsonCat in jsonCats{
                    let cat = Cat(json: jsonCat)
                    arrayCats.append(cat)
                }
                completionHandler(arrayCats, nil)
            }
        })
    }
    
    static func saveAsFav(id: String, completionHandler: @escaping (_ error: Error?) -> Void) {
        var urlString = "https://api.thecatapi.com/v1/favourites"
        
        AF.request(urlString, method: .post, parameters: ["image_id" : id], encoder: JSONParameterEncoder.default, headers: headers, interceptor: nil, requestModifier: nil).responseJSON(completionHandler: {response in
            
            if let error = response.error{
                print(error)
                completionHandler(error)
            }
            
            else {
                completionHandler(nil)
            }
        })
    }
    
    
    static func deleteFav(id: String, completionHandler: @escaping (_ error: Error?) -> Void) {
        var urlString = "https://api.thecatapi.com/v1/favourites/\(id)"
        
        AF.request(urlString, method: .delete, parameters: ["" : ""], encoder: JSONParameterEncoder.default, headers: headers, interceptor: nil, requestModifier: nil).responseJSON(completionHandler: {response in
            
            if let error = response.error{
                print(error)
                completionHandler(error)
            }
            
            else {
                completionHandler(nil)
            }
        })
    }
    
}
