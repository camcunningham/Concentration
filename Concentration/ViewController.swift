//
//  ViewController.swift
//  Concentration
//
//  Created by Cam Cunningham on 2019-06-25.
//  Copyright © 2019 Cam Cunningham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Create a game instance of type concentration
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //Variable for counting flips, if it is set, update it using didset
    var flipCount: Int = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    //Outlet variables
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!

    //Touched a card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //Choose card that was touched
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    //New game button press
    @IBAction func newGame(_ sender: Any) {
        //Make a new game
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        game.resetGame()
        updateViewFromModel()
        flipCount = 0
    }
    
    //Function that updates the view from model
    func updateViewFromModel() {
        //Run through each button, and update it to match its corresponding card
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    //Possible choices for emoji
    var emojiChoices = ["🎃","👻","🦇","🐖","😂","🐯","👝","🐙","🌓"]
    var emoji = Dictionary<Int, String>()
    
    //Function that places emojis on cards randomly
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
}

