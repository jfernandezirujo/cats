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
    
    
}
