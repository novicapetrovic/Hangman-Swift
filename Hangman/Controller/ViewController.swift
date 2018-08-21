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
    var randomIndex = Int(arc4random_uniform(UInt32(13)))   // Ideally 13 would be replaced with allFilms.count but that throws an error
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFilm = allFilms.listOfFilms[randomIndex]
        let firstFilmXXX = convertFilmToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        
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
    
    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet weak var guessesLeftButton: UILabel!
    
    
    var guessesLeft : Int = 7
    
    let imagesArray = ["hangman0", "hangman1", "hangman2", "hangman3", "hangman4", "hangman5", "hangman6"]
    
    @IBAction func letterPressed(_ sender: UIButton) {
        
        let letterGuessed : Character = Character((sender.titleLabel?.text!)!)
        
        print(letterGuessed)
        
        if allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed] != nil {
            print(allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed]!)
            
            for index in allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed]! {
                secretWordLabel.text = replace(myString: secretWordLabel.text!, index as! Int, letterGuessed)
            }
        } else {
            guessesLeft -= 1
            guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
            hangmanImage.image = UIImage(named: imagesArray[guessesLeft])
        }
    }

    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    @IBAction func restartButtonClicked(_ sender: UIButton) {

        randomIndex = Int(arc4random_uniform(UInt32(13)))
        let firstFilm = allFilms.listOfFilms[randomIndex]
        let firstFilmXXX = convertFilmToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        
        var guessesLeft : Int = 7
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        hangmanImage.image = #imageLiteral(resourceName: "hangmanwhite") // <- There's a white image there called "hangmanwhite" but it's very difficult to see.
        
    }
    
    
    // ToDo:
    func userSuccessfullyGuessedWord() {
        
    }
    
    // ToDo:
    func userFailedToGuessWord() {
        
    }
    
}

