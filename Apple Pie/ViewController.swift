//
//  ViewController.swift
//  Apple Pie
//
//  Created by David Strathman on 9/13/19.
//  Copyright © 2019 David Strathman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    var listOfWords = ["potato", "glider", "swing", "girraffe",  "bowling", "buccaneer"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            scoreLabel.text = "Wins = \(totalWins), Losses = \(totalLosses)"
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            scoreLabel.text = "Wins = \(totalWins), Losses = \(totalLosses), The last word was: \(currentGame.word)"
            newRound()
        }
    }
    
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRound()
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, charactersGuessed: [])
            enableLetterButtons(true)
            updateUI()
        }
        else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord.characters
        {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letterCharacter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letterCharacter)
        updateGameState()
    }
    
    
        func updateGameState()
        {
            if currentGame.incorrectMovesRemaining == 0
            {
                totalLosses += 1
            }
            else if currentGame.word == currentGame.formattedWord
            {
                totalWins += 1
            }
            else {
                updateUI()
            }
        }
    }
