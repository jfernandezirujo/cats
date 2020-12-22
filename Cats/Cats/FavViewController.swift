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

    @IBOutlet var tableV: UITableView!

    
    var cat:Cat?
    var arrayCats:[Cat] = [] { didSet
    {
        tableV.reloadData()
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
        title = "Favs"
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
}

extension FavViewController: UITableViewDelegate, UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    arrayCats.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
    
    cell.configureCats(cat: arrayCats[indexPath.row])
    
    return cell
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}

