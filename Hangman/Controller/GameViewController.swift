//
//  ViewController.swift
//  Hangman
//
//  Created by Novica Petrovic on 19/08/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    //MARK:- Variable and Constant
    var selectedCategory: Category?
    var categoryTitlesArray: [SecretWordClass]!
    
    var audioPlayer : AVAudioPlayer!
    var timer = Timer()
    
    var randomIndex = 0
    var guessesLeft : Int = 5
    var winStreak : Int = 0
    var timeLeft : Double = 60
    
    let imagesArray = [hangman0, hangman1, hangman2, hangman3, hangman4, hangman5, hangman6]
    
    //MARK:- IBOutlet
    @IBOutlet weak var keyboardOutlet: UIStackView!
    @IBOutlet weak var winStreakLabel: UILabel!
    @IBOutlet var alphabets: [UIButton]!
    @IBOutlet weak var secretWordLabel: UILabel!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var guessesLeftButton: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Retrieves all categories
        if let category = selectedCategory?.name {
            categoryTitlesArray = DataService.instance.getAllTitles(forCategory: category)
        }
        startGame()
    }
    
    //MARK:- IBAction
    
    //MARK: Letter pressed
    @IBAction func letterPressed(_ sender: UIButton) {
        
        let letterGuessed : Character = Character((sender.titleLabel?.text!)!)
        
        if categoryTitlesArray[randomIndex].indexDictionary[letterGuessed] != nil {
            playSound(playSound: wrongTile)
            sender.backgroundColor = UIColor.green
            sender.isEnabled = false
            
            for index in categoryTitlesArray[randomIndex].indexDictionary[letterGuessed]! {
                secretWordLabel.text = replace(myString: secretWordLabel.text!, index as! Int, letterGuessed)
            }
            
            if secretWordLabel.text == categoryTitlesArray[randomIndex].secretWord {
                playSound(playSound: correctAnswerSound)
                winStreak += 1
                restartForWin()
                print("You Win!")
            }
            
        } else {
            guessesLeft -= 1
            sender.backgroundColor = UIColor.red
            sender.isEnabled = false
            
            if guessesLeft == 0 {
                
                keyboardOutlet.isUserInteractionEnabled = false
                print("You Lose!")
                winStreak = 0
                playSound(playSound: gameOverSound)
                guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
                hangmanImage.image = UIImage(named: imagesArray[guessesLeft])
                revealSecretWord()
                timer.invalidate()
            } else {
                playSound(playSound: correctTile)
                guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
                hangmanImage.image = UIImage(named: imagesArray[guessesLeft])
            }
        }
    }
    
    //MARK: Restart button
    @IBAction func restartButtonClicked(_ sender: UIButton) {
        restartGame()
    }
    
    //MARK:- Function
    
    //MARK:- Start game
    func startGame() {
        
        playBackgroundMusic()
        
        randomIndex = createNonRepeatingRandomIndex()
        let firstFilm = categoryTitlesArray[randomIndex]
        let firstFilmXXX = convertTitleToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        winStreakLabel.text = "Streak: \(winStreak)"
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(GameViewController.action), userInfo: nil, repeats: true)
    }
    
    //MARK: Background music
    var backgroundMusic: AVAudioPlayer? = {
        guard let soundURL = Bundle.main.url(forResource: inGameMusic, withExtension: mp3) else {
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
    
    //MARK: Create non-repeating random index
    func createNonRepeatingRandomIndex() -> Int {
        
        var randomIndex2 = 0
        var randomIndexList = [Int]()
        
        if randomIndexList.count == 0 {
            randomIndexList = Array(0...categoryTitlesArray.count)
            randomIndex2 = randomIndexList.randomItem()!
            randomIndexList = randomIndexList.filter{$0 != randomIndex2}
            return randomIndex2
        } else {
            randomIndex2 = randomIndexList.randomItem()!
            randomIndexList = randomIndexList.filter{$0 != randomIndex2}
            return randomIndex2
        }
        
    }
    
    //MARK: Convert title to secret
    func convertTitleToSecret(film: String) -> String {
        
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
    
    //MARK: Reveal secret word
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
        secretWordLabel.text = categoryTitlesArray[randomIndex].secretWord
    }
    
    //MARK: Replace
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    //MARK: Restart game
    func restartGame() {
        
        for buttons in alphabets {
            buttons.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            buttons.isEnabled = true
        }
        
        timer.invalidate()
        timeLeft = 60
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(GameViewController.action), userInfo: nil, repeats: true)
        
        keyboardOutlet.isUserInteractionEnabled = true
        
        randomIndex = createNonRepeatingRandomIndex()
        let firstFilm = categoryTitlesArray[randomIndex]
        let firstFilmXXX = convertTitleToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        
        guessesLeft = 5
        winStreak = 0
        winStreakLabel.text = "Streak: \(winStreak)"
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        hangmanImage.image = nil
        
    }
    
    //MARK: Restart for win
    func restartForWin() {
        
        for buttons in alphabets {
            buttons.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            buttons.isEnabled = true
        }
        
        timer.invalidate()
        timeLeft = Double(60 - winStreak)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(GameViewController.action), userInfo: nil, repeats: true)
        
        keyboardOutlet.isUserInteractionEnabled = true
        
        randomIndex = createNonRepeatingRandomIndex()
        let firstFilm = categoryTitlesArray[randomIndex]
        let firstFilmXXX = convertTitleToSecret(film: firstFilm.secretWord)
        secretWordLabel.text = firstFilmXXX
        print(firstFilm.secretWord)
        
        guessesLeft = 5
        winStreakLabel.text = "Streak: \(winStreak)"
        guessesLeftButton.text = "Guesses Left: \(guessesLeft)"
        hangmanImage.image = nil
        
    }
    
    //MARK: Play sound
    func playSound(playSound: String) {
        
        let soundURL = Bundle.main.url(forResource: playSound, withExtension: mp3)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            
        }
    }
    
    //MARK: Action
    @objc func action() {
        
        timeLeft -= 0.1
        let roundedTime = Double(round(10*timeLeft)/10)
        timeLabel.text = String(roundedTime)
        
        if roundedTime == 0.0 {
            keyboardOutlet.isUserInteractionEnabled = false
            timer.invalidate()
            timeLabel.text = "0.00"
            playSound(playSound: gameOverSound)
        }
    }
    
    // Set status bar to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

//MARK:- Array
extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
