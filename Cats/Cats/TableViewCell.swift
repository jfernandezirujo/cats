//
//  TableViewCell.swift
//  Cats
//
//  Created by Josefina Perez on 22/12/2020.
//  Copyright © 2020 Julieta Fer. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet var imgCat: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func configureCats(cat: Cat){
//            guard let cat = cat else { return }
    
            let url = URL(string: cat.url)
        
            imgCat.kf.setImage(with: url)
    
        }

}
