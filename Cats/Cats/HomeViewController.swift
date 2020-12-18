//
//  ViewController.swift
//  Cats
//
//  Created by Josefina Perez on 16/12/2020.
//  Copyright © 2020 Julieta Fer. All rights reserved.
//

import UIKit
import Kingfisher


class HomeViewController: UIViewController {

    @IBOutlet var lblCat: UILabel!
    @IBOutlet var imgCat: UIImageView!
    @IBOutlet var btnReload: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getCats()
    }
    

    func configureUI() {
        lblCat.text = "CATS!"
        lblCat.textColor = .black
        
        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(systemName: "house")
        
        btnReload.setTitle("get cat", for: .normal)
    }
    
    func getCats(){
        CatsRepository.getCats(completionHandler: { cats, error in
            
            if let error = error {
                print(error)
            }
           else if let cat = cats.first {
                self.showImage(url: cat.url)
            }
        })
    }
    
    func showImage(url: String) {
        let url = URL(string: url)
        imgCat.kf.setImage(with: url)
    }
    
    @IBAction func reloadCat(){
        getCats()
    }
    
}

