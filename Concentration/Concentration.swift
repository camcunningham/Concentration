//
//  Concentration.swift
//  Concentration
//
//  Created by Cam Cunningham on 2019-06-29.
//  Copyright © 2019 Cam Cunningham. All rights reserved.
//

import Foundation

class Concentration {
    
    //Cards array
    var cards: [Card] = []
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // Choose card func run when a user touches a card
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func resetGame() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
    }
    
    //Init func, takes n card pairs as param and creates a card array containing n pairs
    init(numberOfPairsOfCards: Int) {
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
        
    }
}
