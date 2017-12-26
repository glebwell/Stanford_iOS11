//
//  Concentration.swift
//  Concentration
//
//  Created by Admin on 20.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import Foundation

class Concentration {

    private var indexOfOneAndOnlyFaceUpCard: Int?
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var score = 0

    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }

    func startNewGame() {
        flipCount = 0
        score = 0
        for i in cards.indices {
            cards[i].isFaceUp = false
            cards[i].isMatched = false
            cards[i].isOnceOpened = false
        }
        cards.shuffle()
    }

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if cards[index].isOnceOpened {
                        score -= 1
                    } else {
                        cards[index].isOnceOpened = true
                    }
                    if cards[matchIndex].isOnceOpened {
                        score -= 1
                    }
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
