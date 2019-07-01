//
//  Card.swift
//  Concentration
//
//  Created by Cam Cunningham on 2019-06-29.
//  Copyright © 2019 Cam Cunningham. All rights reserved.
//

import Foundation

//Card structure
struct Card {
    
    //Card properties
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    //Every time a card is created, make a unique id for it
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
