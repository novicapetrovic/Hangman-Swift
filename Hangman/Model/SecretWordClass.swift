//
//  Model.swift
//  Hangman
//
//  Created by Novica Petrovic on 19/08/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import Foundation

class SecretWordClass {
    
    var secretWord : String
    
    var indexDictionary : [Character : NSMutableArray]
    
    init(film: String) {
        
        secretWord = film
        
        func createDictionary(film: String) -> [Character : NSMutableArray] {
            
            var myDict : [Character : NSMutableArray] = [:]
            
            var index = 0
            
            for letter in film {
                
                if myDict[letter] == nil {
                    myDict[letter] = [index]
                } else {
                    myDict[letter]?.add(index)
                }
                index += 1
            }
            return myDict
        }
        indexDictionary = createDictionary(film: secretWord)
    }
    
}
