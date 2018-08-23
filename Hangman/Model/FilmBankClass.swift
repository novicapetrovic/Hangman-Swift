//
//  FilmBank.swift
//  Hangman
//
//  Created by Novica Petrovic on 19/08/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//

import Foundation

class FilmBankClass  {
    
    var listOfFilms = [SecretWordClass]()
    
    init() {
        
        let item = SecretWordClass(film: "indiana jones")
        listOfFilms.append(item)
        listOfFilms.append(SecretWordClass(film: "lord of the rings"))
        listOfFilms.append(SecretWordClass(film: "the wolf of wall street"))
        listOfFilms.append(SecretWordClass(film: "saving private ryan"))
        listOfFilms.append(SecretWordClass(film: "shawshank redemption"))
        listOfFilms.append(SecretWordClass(film: "the dark knight"))
        listOfFilms.append(SecretWordClass(film: "the godfather"))
        listOfFilms.append(SecretWordClass(film: "forrest gump"))
        listOfFilms.append(SecretWordClass(film: "catch me if you can"))
        listOfFilms.append(SecretWordClass(film: "the silence of the lambs"))
        listOfFilms.append(SecretWordClass(film: "back to the future"))
        listOfFilms.append(SecretWordClass(film: "django unchained"))
        listOfFilms.append(SecretWordClass(film: "star wars"))
        listOfFilms.append(SecretWordClass(film: "oceans eleven"))
        
    }
    
}
