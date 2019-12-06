//
//  Game.swift
//  Apple Pie
//
//  Created by David Strathman on 9/13/19.
//  Copyright © 2019 David Strathman. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var charactersGuessed: [Character]
    var formattedWord: String
    {
        var guessedWord = ""
        for letter in word.characters{
            if charactersGuessed.contains(letter)
            {
                guessedWord += "\(letter)"
            }
            else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    
    
    
    mutating func playerGuessed(letter: Character)
    {
        charactersGuessed.append(letter)
        if !word.characters.contains(letter)
        {
            incorrectMovesRemaining -= 1
        }
        
    }
    
}
