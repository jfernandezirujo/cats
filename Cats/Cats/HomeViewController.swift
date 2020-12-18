//
//  ViewController.swift
//  Cats
//
//  Created by Josefina Perez on 16/12/2020.
//  Copyright © 2020 Julieta Fer. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var lblCat: UILabel!
    @IBOutlet var imgCat: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        CatsRepository.getCats(completionHandler: { error in
            
            
        })
    }

    func configureUI() {
        lblCat.text = "CATS!"
        lblCat.textColor = .black
        
        imgCat.image = UIImage(named: "Image")
        
        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(systemName: "house")
    }
}

