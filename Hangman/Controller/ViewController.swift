//
//  ViewController.swift
//  Hangman
//
//  Created by Novica Petrovic on 19/08/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let allFilms = FilmBankClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomIndex = Int(arc4random_uniform(UInt32(allFilms.listOfFilms.count)))
        let firstFilm = allFilms.listOfFilms[randomIndex].secretWord
        let firstFilmXXX = convertFilmToSecret(film: firstFilm)
        secretWordLabel.text = firstFilmXXX
        
    }

    @IBOutlet weak var secretWordLabel: UILabel!
    
    func convertFilmToSecret(film: String) -> String {

        var XXX = ""
        
        for letter in film {
            if letter == " " {
                XXX.append(" ")
            } else {
                XXX.append("-")
            }
        }
        return XXX
    }
    

    
    


}

