//
//  Concentration.swift
//  Concentration
//
//  Created by Admin on 20.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import Foundation

class Concentration {

    var indexOfOneAndOnlyFaceUpCard: Int?

    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
    
    var cards = [Card]()

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            //cards[index].isFaceUp = !cards[index].isFaceUp
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }

    }
}
