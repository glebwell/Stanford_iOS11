//
//  Concentration.swift
//  Concentration
//
//  Created by Admin on 20.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import Foundation

class Concentration {

    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
    
    var cards = [Card]()

    func chooseCard(at index: Int) {
        cards[index].isFaceUp = !cards[index].isFaceUp
    }
}
