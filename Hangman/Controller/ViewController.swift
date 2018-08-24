//
//  ViewController.swift
//  Hangman
//
//  Created by Novica Petrovic on 19/08/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBackgroundMusic()
        
        let firstFilm = allFilms.listOfFilms[randomIndex]
        let firstFilmXXX = convertFilmToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        winStreakLabel.text = "Streak: \(winStreak)"
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
    }
    
    var audioPlayer : AVAudioPlayer!
    
    var backgroundMusic: AVAudioPlayer? = {
        guard let soundURL = Bundle.main.url(forResource: "Trimmed Saw SoundTrack", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: soundURL)
            player.numberOfLoops = -1
            return player
        } catch {
            return nil
        }
    }()
    
    func playBackgroundMusic() {
        backgroundMusic?.play()
    }

    let allFilms = FilmBankClass()
    
    var randomIndex = Int(arc4random_uniform(UInt32(13)))   // Ideally 13 would be replaced with allFilms.count but that throws an error for some reason
    
    @IBOutlet weak var keyboardOutlet: UIStackView!
    
    
    @IBOutlet weak var winStreakLabel: UILabel!
    
    @IBOutlet var alphabets: [UIButton]!
    
    @IBOutlet weak var secretWordLabel: UILabel!
    
    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet weak var guessesLeftButton: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    
    
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
    
    var winStreak : Int = 0
    
    @IBAction func letterPressed(_ sender: UIButton) {
        
        let letterGuessed : Character = Character((sender.titleLabel?.text!)!)
        
        print(letterGuessed)
    
            if allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed] != nil {
                playSound(guessTrue: 1)
                sender.backgroundColor = UIColor.black
                sender.isEnabled = false
                print(allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed]!)
                
                for index in allFilms.listOfFilms[randomIndex].indexDictionary[letterGuessed]! {
                    secretWordLabel.text = replace(myString: secretWordLabel.text!, index as! Int, letterGuessed)
                }
                
                if secretWordLabel.text == allFilms.listOfFilms[randomIndex].secretWord {
                    playSound(guessTrue: 3)
                    restartButton()
                    print("You Win!")
                    winStreak += 1
                    winStreakLabel.text = "Streak: \(winStreak)"
                }
                
            } else {
                guessesLeft -= 1
                sender.backgroundColor = UIColor.red
                sender.isEnabled = false
                
                if guessesLeft == 0 {
                    
                    keyboardOutlet.isUserInteractionEnabled = false
                    print("You Lose!")
                    winStreak = 0
                    playSound(guessTrue: 2)
                    guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
                    hangmanImage.image = UIImage(named: imagesArray[guessesLeft])
                    revealSecretWord()
                    timer.invalidate()
                } else {
                    playSound(guessTrue: 0)
                    guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
                    hangmanImage.image = UIImage(named: imagesArray[guessesLeft])
                }
        }
    }

    func revealSecretWord() {
        
        var indexArray : [Int] = []
        var count = 0
        
        for index in secretWordLabel.text! {
            if index == "-" {
                indexArray.append(count)
                count += 1
            } else {
                count += 1
            }
        }
        secretWordLabel.text = allFilms.listOfFilms[randomIndex].secretWord
    }
    
    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    func restartButton() {
        
        for buttons in alphabets {
            buttons.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            buttons.isEnabled = true
        }
        
        timeLeft = Double(60 - (winStreak * 2))
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        keyboardOutlet.isUserInteractionEnabled = true
        
        randomIndex = Int(arc4random_uniform(UInt32(13)))
        let firstFilm = allFilms.listOfFilms[randomIndex]
        let firstFilmXXX = convertFilmToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        
        guessesLeft = 5
        winStreak = 0
        winStreakLabel.text = "Streak: \(winStreak)"
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        hangmanImage.image = nil
        hangmanImage.backgroundColor = UIColor.black
        
    }
    
    var soundArray = ["Creepy_Percussion_8", "Creepy-Roll-Over-2", "Jigsaw Laugh 2017", "Correct Answer Sound Effect"]
    
    func playSound(guessTrue: Int) {
        
        let soundURL = Bundle.main.url(forResource: soundArray[guessTrue], withExtension: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            
        }
    }
    
    @IBAction func restartButtonClicked(_ sender: UIButton) {
        restartButton()
    }
    
    var timeLeft : Double = 60
    var timer = Timer()
    
    @objc func action() {
        
        timeLeft -= 0.01
        let roundedTime = Double(round(100*timeLeft)/100)
        timeLabel.text = String(roundedTime)
        
        if roundedTime == 0.0 {
            timer.invalidate()
            timeLabel.text = "0.00"
        }
    }
    
    
}

