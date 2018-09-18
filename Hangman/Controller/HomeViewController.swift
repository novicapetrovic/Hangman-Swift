//
//  HomeViewController.swift
//  Hangman
//
//  Created by Shiva Skanthan on 06/09/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var allCategories: [Category]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:- Retrieve all categories
        allCategories = DataService.instance.getAllCategories()
        
    }
    
    //MARK:- Starts game with Film category
    @IBAction func filmButtonPressed(_ sender: Any) {
        startGame(forCategory: allCategories![0])
    }
    
    //MARK:- Starts game with Country category
    @IBAction func countryButtonPressed(_ sender: Any) {
        startGame(forCategory: allCategories![1])
    }
    
    //MARK:- Presents GameViewController when a category is selected
    func startGame(forCategory category: Category) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        vc.selectedCategory =   category
        present(vc, animated: true, completion: nil)
    }
    
    //MARK:- Set status bar to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
