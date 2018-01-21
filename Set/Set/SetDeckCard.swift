//
//  SetDeckCard.swift
//  Set
//
//  Created by Gleb on 21.01.18.
//  Copyright © 2018 Gleb. All rights reserved.
//

import Foundation

struct SetCardDeck {
    private(set) var cards = [SetCard]()

    init() {
        for number in SetCard.Variant.all {
            for color in SetCard.Variant.all {
                for shape in SetCard.Variant.all {
                    for fill in SetCard.Variant.all {
                        cards.append(SetCard(number: number,
                                             color: color,
                                             shape: shape,
                                             fill: fill))
                    }
                }
            }
        }
    }

    mutating func draw() -> SetCard? {
        return cards.isEmpty ? nil : cards.remove(at: cards.count.arc4random)
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
