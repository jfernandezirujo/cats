//
//  FavViewController.swift
//  Cats
//
//  Created by Josefina Perez on 21/12/2020.
//  Copyright © 2020 Julieta Fer. All rights reserved.
//

import UIKit
import Kingfisher


class FavViewController: UIViewController {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblID: UILabel!
    
    var cat:Cat?
    var arrayCats:[Cat] = [] { didSet
    {
//         recargar tabla
    }
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getFavCats()
    }
    
    func configureUI(){
        lbl.text = "Favs"
        
        tabBarItem.title = "Favs"
        tabBarItem.image = UIImage(systemName: "heart")
    }
    
    func getFavCats(){
        CatsRepository.getFavs(completionHandler: { arrayFavCats, error in
            
            if let error = error {
                print(error)
            }
            
            else if let arrayFavCats = arrayFavCats {
                self.arrayCats = arrayFavCats
                }

            })
    }
    

//    func configureCats(){
//        guard let cat = cat else { return }
//
//        let url = URL(string: cat.url)
    
//        lblID.text = cat.id
//        img.kf.setImage(with: url)
//
//    }

}
