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
    @IBOutlet var btnFav: UIButton!
    
    var cat: Cat?
    var favorited: Bool = false { didSet
        {
            configureFavBtn()
        }
    }
    
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
        btnFav.setTitle("Like", for: .normal)
    }
    
    func getCats(){
        CatsRepository.getCats(completionHandler: { cats, error in
            
            if let error = error {
                print(error)
            }
           else if let cat = cats.first {
                self.cat = cat
                self.showImage(url: cat.url)
                self.favorited = false
            }
        })
    }
    
    func showImage(url: String) {
        let url = URL(string: url)
        imgCat.kf.setImage(with: url)
    }
    
    func favCat(){
        guard let cat = cat else { return }
        
        CatsRepository.saveAsFav(id: cat.id, completionHandler: {
            error in
            
            if let error = error{
                print(error)
            }
            else {
                self.favorited = true
            }
        })
    }
    
    func configureFavBtn() {
        if favorited {
            btnFav.setTitle("dislike", for: .normal)
              }
              else {
            btnFav.setTitle("like", for: .normal)
              }
    }
    
    
    func deleteFav() {
        
        guard let cat = cat else { return }
        
        CatsRepository.deleteFav(id: cat.id, completionHandler: {
            error in
            
            if let error = error {
                print(error)
            }
            
            else{
                self.favorited = false
            }
        })
    }
    
    @IBAction func reloadCat(){
        getCats()
    }
    
    @IBAction func fav(){
        
        if favorited {
            deleteFav()
        }
        else {
           favCat()
            
        }
        
        
    }
    
}

