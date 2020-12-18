//
//  Cat.swift
//  Cats
//
//  Created by Josefina Perez on 18/12/2020.
//  Copyright © 2020 Julieta Fer. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cat {
    var id: String
    var url: String
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.url = json["url"].stringValue
    }
}
