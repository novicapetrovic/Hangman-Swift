//
//  DataService.swift
//  Hangman
//
//  Created by Shiva Skanthan on 09/09/2018.
//  Copyright © 2018 Novica Petrovic. All rights reserved.
//
//  Contains all the data and data related functions for categories and titles within a category

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(name: "FILM"),
        Category(name: "COUNTRY")
    ]
    
    private let filmsArray = [
        
        //Movies
        SecretWordClass(title: "indiana jones"),
        SecretWordClass(title: "lord of the rings"),
        SecretWordClass(title: "the wolf of wall street"),
        SecretWordClass(title: "saving private ryan"),
        SecretWordClass(title: "shawshank redemption"),
        SecretWordClass(title: "the dark knight"),
        SecretWordClass(title: "the godfather"),
        SecretWordClass(title: "forrest gump"),
        SecretWordClass(title: "catch me if you can"),
        SecretWordClass(title: "the silence of the lambs"),
        SecretWordClass(title: "back to the future"),
        SecretWordClass(title: "django unchained"),
        SecretWordClass(title: "star wars"),
        SecretWordClass(title: "there will be blood"),
        SecretWordClass(title: "no country for old men"),
        SecretWordClass(title: "the hurt locker"),
        SecretWordClass(title: "the social network"),
        SecretWordClass(title: "wedding crashers"),
        SecretWordClass(title: "pirates of the caribbean"),
        SecretWordClass(title: "the da vinci code"),
        SecretWordClass(title: "mission impossible"),
        SecretWordClass(title: "blood diamond"),
        SecretWordClass(title: "the pursuit of happyness"),
        SecretWordClass(title: "night at the museum"),
        SecretWordClass(title: "slumdog millionaire"),
        SecretWordClass(title: "the curious case of benjamin button"),
        SecretWordClass(title: "pineapple express"),
        SecretWordClass(title: "role models"),
        SecretWordClass(title: "the hangover"),
        SecretWordClass(title: "law abiding citizen"),
        SecretWordClass(title: "shutter island"),
        SecretWordClass(title: "the kings speech"),
        SecretWordClass(title: "the other guys"),
        SecretWordClass(title: "planet of the apes"),
        SecretWordClass(title: "silver linings playbook"),
        SecretWordClass(title: "dallas buyers club"),
        SecretWordClass(title: "the conjuring"),
        SecretWordClass(title: "guardians of the galaxy"),
        SecretWordClass(title: "the imitation game"),
        SecretWordClass(title: "the theory of everything"),
        SecretWordClass(title: "the revenant"),
        SecretWordClass(title: "the hateful eight"),
        SecretWordClass(title: "bridge of spies"),
        SecretWordClass(title: "hacksaw ridge"),
        
        // Series
        SecretWordClass(title: "breaking bad"),
        SecretWordClass(title: "game of thrones"),
        SecretWordClass(title: "the walking dead"),
        SecretWordClass(title: "better call saul"),
        SecretWordClass(title: "homeland"),
        SecretWordClass(title: "stranger things"),
        SecretWordClass(title: "orange is the new black"),
        SecretWordClass(title: "house of cards"),
        SecretWordClass(title: "making a murderer"),
        SecretWordClass(title: "master of none"),
        SecretWordClass(title: "black mirror"),
        SecretWordClass(title: "peaky blinders"),
        SecretWordClass(title: "american horror story"),
        SecretWordClass(title: "sons of anarchy")
    ]
    
    private let countryArray = [
        // A (11 countries)
        SecretWordClass(title: "afghanistan"),
        SecretWordClass(title: "albania"),
        SecretWordClass(title: "algeria"),
        SecretWordClass(title: "andorra"),
        SecretWordClass(title: "angola"),
        SecretWordClass(title: "antigua and barbuda"),
        SecretWordClass(title: "argentina"),
        SecretWordClass(title: "armenia"),
        SecretWordClass(title: "australia"),
        SecretWordClass(title: "austria"),
        SecretWordClass(title: "azerbaijan"),
        
        // B (17 countries)
        SecretWordClass(title: "the bahamas"),
        SecretWordClass(title: "bahrain"),
        SecretWordClass(title: "bangladesh"),
        SecretWordClass(title: "barbados"),
        SecretWordClass(title: "belarus"),
        SecretWordClass(title: "belgium"),
        SecretWordClass(title: "belize"),
        SecretWordClass(title: "benin"),
        SecretWordClass(title: "bhutan"),
        SecretWordClass(title: "bolivia"),
        SecretWordClass(title: "bosnia and herzegovina"),
        SecretWordClass(title: "botswana"),
        SecretWordClass(title: "brazil"),
        SecretWordClass(title: "brunei"),
        SecretWordClass(title: "bulgaria"),
        SecretWordClass(title: "burkina faso"),
        SecretWordClass(title: "burundi"),
        
        // C (15 countries, excluding congo (2 versions, got confused) and cote d'ivoire)
        SecretWordClass(title: "cabo verde"),
        SecretWordClass(title: "cambodia"),
        SecretWordClass(title: "cameroon"),
        SecretWordClass(title: "canada"),
        SecretWordClass(title: "central african republic"),
        SecretWordClass(title: "chad"),
        SecretWordClass(title: "chile"),
        SecretWordClass(title: "china"),
        SecretWordClass(title: "columbia"),
        SecretWordClass(title: "comoros"),
        SecretWordClass(title: "costa rica"),
        SecretWordClass(title: "croatia"),
        SecretWordClass(title: "cuba"),
        SecretWordClass(title: "cyprus"),
        SecretWordClass(title: "czech republic"),
        
        // D (4 countries)
        SecretWordClass(title: "denmark"),
        SecretWordClass(title: "dijbouti"),
        SecretWordClass(title: "dominica"),
        SecretWordClass(title: "dominican republic"),
        
        // E (8 countries)
        SecretWordClass(title: "east timor"),
        SecretWordClass(title: "ecuador"),
        SecretWordClass(title: "egypt"),
        SecretWordClass(title: "el salvador"),
        SecretWordClass(title: "equatorial guinea"),
        SecretWordClass(title: "eritrea"),
        SecretWordClass(title: "estonia"),
        SecretWordClass(title: "ethiopia"),
        
        // F (3 countries)
        SecretWordClass(title: "fiji"),
        SecretWordClass(title: "finland"),
        SecretWordClass(title: "france"),
        
        // G (11 countries)
        SecretWordClass(title: "gambon"),
        SecretWordClass(title: "gambia"),
        SecretWordClass(title: "georgia"),
        SecretWordClass(title: "germany"),
        SecretWordClass(title: "ghana"),
        SecretWordClass(title: "greece"),
        SecretWordClass(title: "grenada"),
        SecretWordClass(title: "guatemala"),
        SecretWordClass(title: "guinea"),
        SecretWordClass(title: "guinea bissau"),
        SecretWordClass(title: "guvana"),
        
        // H (3 countries)
        SecretWordClass(title: "haiti"),
        SecretWordClass(title: "honduras"),
        SecretWordClass(title: "hungary"),
        
        // I (8 countries)
        SecretWordClass(title: "iceland"),
        SecretWordClass(title: "india"),
        SecretWordClass(title: "indonesia"),
        SecretWordClass(title: "iran"),
        SecretWordClass(title: "iraq"),
        SecretWordClass(title: "ireland"),
        SecretWordClass(title: "israel"),
        SecretWordClass(title: "italy"),
        
        // J (3 countries)
        SecretWordClass(title: "jamaica"),
        SecretWordClass(title: "japan"),
        SecretWordClass(title: "jordan"),
        
        // K (8 countries)
        SecretWordClass(title: "kazakhstan"),
        SecretWordClass(title: "kenya"),
        SecretWordClass(title: "kiribati"),
        SecretWordClass(title: "north korea"),
        SecretWordClass(title: "south korea"),
        SecretWordClass(title: "kosovo"),
        SecretWordClass(title: "kuwait"),
        SecretWordClass(title: "kyrgyzstan"),
        
        // L (9 countries)
        SecretWordClass(title: "laos"),
        SecretWordClass(title: "latvia"),
        SecretWordClass(title: "lebanon"),
        SecretWordClass(title: "lesotho"),
        SecretWordClass(title: "liberia"),
        SecretWordClass(title: "libya"),
        SecretWordClass(title: "liechtenstein"),
        SecretWordClass(title: "lithuania"),
        SecretWordClass(title: "luxembourg"),
        
        // M (19 countries)
        SecretWordClass(title: "macedonia"),
        SecretWordClass(title: "madagascar"),
        SecretWordClass(title: "malawi"),
        SecretWordClass(title: "malaysia"),
        SecretWordClass(title: "maldives"),
        SecretWordClass(title: "mali"),
        SecretWordClass(title: "malta"),
        SecretWordClass(title: "marshall islands"),
        SecretWordClass(title: "mauritania"),
        SecretWordClass(title: "mauritius"),
        SecretWordClass(title: "mexico"),
        SecretWordClass(title: "federate states of micronesia"),
        SecretWordClass(title: "moldova"),
        SecretWordClass(title: "monaco"),
        SecretWordClass(title: "mongolia"),
        SecretWordClass(title: "montenegro"),
        SecretWordClass(title: "morocco"),
        SecretWordClass(title: "mozambique"),
        SecretWordClass(title: "myanmar"),
        
        // N (9 countries)
        SecretWordClass(title: "namibia"),
        SecretWordClass(title: "nauru"),
        SecretWordClass(title: "nepal"),
        SecretWordClass(title: "netherlands"),
        SecretWordClass(title: "new zealand"),
        SecretWordClass(title: "nicaragua"),
        SecretWordClass(title: "niger"),
        SecretWordClass(title: "nigeria"),
        SecretWordClass(title: "norway"),
        
        // O (1 country)
        SecretWordClass(title: "oman"),
        
        // P (10 countries)
        SecretWordClass(title: "pakistan"),
        SecretWordClass(title: "palau"),
        SecretWordClass(title: "panama"),
        SecretWordClass(title: "papa new guinea"),
        SecretWordClass(title: "paraguay"),
        SecretWordClass(title: "peru"),
        SecretWordClass(title: "philippines"),
        SecretWordClass(title: "poland"),
        SecretWordClass(title: "portugal"),
        SecretWordClass(title: "qatar"),
        
        // R (3 countries)
        SecretWordClass(title: "romania"),
        SecretWordClass(title: "russia"),
        SecretWordClass(title: "rwanda"),
        
        // S (26 countries)
        SecretWordClass(title: "saint kitts and nevis"),
        SecretWordClass(title: "saint lucia"),
        SecretWordClass(title: "saint vincent and the grenadines"),
        SecretWordClass(title: "samoa"),
        SecretWordClass(title: "san marino"),
        SecretWordClass(title: "sao tome and principe"),
        SecretWordClass(title: "saudia arabia"),
        SecretWordClass(title: "senegal"),
        SecretWordClass(title: "serbia"),
        SecretWordClass(title: "seychelles"),
        SecretWordClass(title: "sierra leone"),
        SecretWordClass(title: "singapore"),
        SecretWordClass(title: "slovakia"),
        SecretWordClass(title: "slovenia"),
        SecretWordClass(title: "solomon islands"),
        SecretWordClass(title: "somalia"),
        SecretWordClass(title: "south africa"),
        SecretWordClass(title: "spain"),
        SecretWordClass(title: "sri lanka"),
        SecretWordClass(title: "sudan"),
        SecretWordClass(title: "south sudan"),
        SecretWordClass(title: "suriname"),
        SecretWordClass(title: "swaziland"),
        SecretWordClass(title: "sweden"),
        SecretWordClass(title: "switzerland"),
        SecretWordClass(title: "syria"),
        
        // T (11 countries)
        SecretWordClass(title: "taiwan"),
        SecretWordClass(title: "tajikistan"),
        SecretWordClass(title: "tanzania"),
        SecretWordClass(title: "thailand"),
        SecretWordClass(title: "togo"),
        SecretWordClass(title: "tonga"),
        SecretWordClass(title: "trinidad and tobago"),
        SecretWordClass(title: "tunisia"),
        SecretWordClass(title: "turkey"),
        SecretWordClass(title: "turkmenistan"),
        SecretWordClass(title: "tuvalu"),
        
        // U (7 countries)
        SecretWordClass(title: "uganda"),
        SecretWordClass(title: "ukraine"),
        SecretWordClass(title: "united arab emirates"),
        SecretWordClass(title: "united kingdom"),
        SecretWordClass(title: "united states"),
        SecretWordClass(title: "uruguay"),
        SecretWordClass(title: "uzbekistan"),
        
        // V (4 countries)
        SecretWordClass(title: "vanuatu"),
        SecretWordClass(title: "vatican city"),
        SecretWordClass(title: "venezuela"),
        SecretWordClass(title: "vietnam"),
        
        // Y (1 country)
        SecretWordClass(title: "yemen"),
        
        // Z (
        SecretWordClass(title: "zambia"),
        SecretWordClass(title: "zimbabwe")
    ]
    
    //MARK: Get all categories
    func getAllCategories() -> [Category] {
        return categories
    }
    
    //MARK: Get all titles for a category
    func getAllTitles(forCategory title: String) -> [SecretWordClass] {
        switch title {
        case "FILM":
            return getFilms()
        case "COUNTRY":
            return getCountry()
        default:
            return getFilms()
        }
    }
    
    func getFilms() -> [SecretWordClass] {
      return filmsArray
    }
    
    func getCountry() -> [SecretWordClass] {
        return countryArray
    }
}
