//
//  ViewController.swift
//  Hangman
//
//  Created by Novica Petrovic on 19/08/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!

    let allFilms = FilmBankClass()
    var randomIndex = Int(arc4random_uniform(UInt32(13)))   // Ideally 13 would be replaced with allFilms.count but that throws an error
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBackgroundMusic()
        
        let firstFilm = allFilms.listOfFilms[randomIndex]
        let firstFilmXXX = convertFilmToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        
    }
    
    
    @IBOutlet weak var keyboardOutlet: UIStackView!
    
    @IBOutlet weak var secretWordLabel: UILabel!
    
    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet weak var guessesLeftButton: UILabel!
    
    
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
    
    var guessesLeft : Int = 5
    
    let imagesArray = ["hangman0", "hangman1", "hangman2", "hangman3", "hangman4", "hangman5", "hangman6"]
    
    
    @IBAction func letterPressed(_ sender: UIButton) {
        
        let letterGuessed : Character = Character((sender.titleLabel?.text!)!)
        
        print(letterGuessed)
        
        if allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed] != nil {
            playSound(guessTrue: 1)
            print(allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed]!)
            
            for index in allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed]! {
                secretWordLabel.text = replace(myString: secretWordLabel.text!, index as! Int, letterGuessed)
            }
            
            if secretWordLabel.text == allFilms.listOfFilms[randomIndex].secretWord {
                
                print("You Win!")
            }
            
        } else {
            guessesLeft -= 1
            
            if guessesLeft == 0 {
                
                keyboardOutlet.isUserInteractionEnabled = false
                print("You Lose!")
                playSound(guessTrue: 2)
                guessesLeftButton.text = "Guesses Left: 0"
                hangmanImage.image = UIImage(named: imagesArray[0])
            } else {
                playSound(guessTrue: 0)
                guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
                hangmanImage.image = UIImage(named: imagesArray[guessesLeft])
            }
        }
    }

    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    @IBAction func restartButtonClicked(_ sender: UIButton) {
        
        keyboardOutlet.isUserInteractionEnabled = true
        randomIndex = Int(arc4random_uniform(UInt32(13)))
        let firstFilm = allFilms.listOfFilms[randomIndex]
        let firstFilmXXX = convertFilmToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        
        guessesLeft = 5
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        hangmanImage.image = #imageLiteral(resourceName: "hangmanwhite") // <- There's a white image there called "hangmanwhite" but it's very difficult to see.
        
    }
    
    func playBackgroundMusic() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error, couldn't play background music")
        }
        
        
        let soundURL = Bundle.main.url(forResource: "Saw SoundTrack", withExtension: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
        }
        catch {
            
        }
    }
    
    var soundArray = ["Creepy_Percussion_8", "Creepy-Roll-Over-2", "Jigsaw Laugh 2017"]
    
    func playSound(guessTrue: Int) {
        
        let soundURL = Bundle.main.url(forResource: soundArray[guessTrue], withExtension: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            
        }
    }
    
    
    // ToDo:
    func userSuccessfullyGuessedWord() {
        
    }
    
    // ToDo:
    func userFailedToGuessWord() {
        
    }
    
    
}

