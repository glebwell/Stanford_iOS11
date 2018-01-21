//
//  SetGame.swift
//  Set
//
//  Created by Gleb on 21.01.18.
//  Copyright © 2018 Gleb. All rights reserved.
//

import Foundation

struct SetGame {
    private(set) var cardsOnTable = [SetCard]()
    private(set) var cardsSelected = [SetCard]()
    private(set) var cardsTryMatched = [SetCard]()
    private(set) var cardsRemoved = [SetCard]()

    private var deck = SetCardDeck()

    var deckCount: Int { return deck.cards.count }

    private mutating func takeThreeFromDeck() -> [SetCard]? {
        var threeCards = [SetCard]()
        for _ in 0...2 {
            if let card = deck.draw() {
                threeCards.append(card)
            } else {
                return nil
            }
        }
        return threeCards
    }

    private mutating func replaceOrRemoveThreeCards() {
        if let takeThreeCards = takeThreeFromDeck() {
            cardsOnTable.replace(elements: cardsTryMatched, with: takeThreeCards)
        } else {
            cardsOnTable.remove(elements: cardsTryMatched)
        }

        cardsRemoved += cardsTryMatched
        cardsTryMatched.removeAll()
    }

    mutating func dealThree() {
        if let dealThreeCards = takeThreeFromDeck() {
            cardsOnTable += dealThreeCards
        }
    }

    mutating func chooseCard(at index: Int) {
        assert(cardsOnTable.indices.contains(index),
               "SetGame.chooseCard(at: \(index)) : Chosen index out of range")

        let cardChosen = cardsOnTable[index]
        if !cardsRemoved.contains(cardChosen) && !cardsTryMatched.contains(cardChosen) {
            if isSet == true {
                replaceOrRemoveThreeCards()
                isSet = nil
            }
        }

        if cardsSelected.count == 2, !cardsSelected.contains(cardChosen) {
            cardsSelected += [cardChosen]
            isSet = SetCard.isSet(cards: cardsSelected)
        } else {
            cardsSelected.inOut(element: cardChosen)
        }

        //flipCount += 1
        //score -= Points.flipOverPenalty
    }

    var isSet: Bool? {
        get {
            guard cardsTryMatched.count == 3 else { return nil }
            return SetCard.isSet(cards: cardsTryMatched)
        }

        set {
            if newValue != nil {
                cardsTryMatched = cardsSelected
                cardsSelected.removeAll()
            } else {
                cardsTryMatched.removeAll()
            }
        }
    }
}

extension Array where Element : Equatable {
    /// переключаем присутствие элемента в массиве:
    /// если нет - включаем, если есть - удаляем
    mutating func inOut(element: Element) {
        if let from = self.index(of:element) {
            self.remove(at: from)
        } else {
            self.append(element)
        }
    }

    mutating func remove(elements: [Element]) {
        /// Удаляем массив элементов из массива
        self = self.filter { !elements.contains($0) }
    }

    mutating func replace(elements: [Element], with new: [Element]) {
        /// Заменяем элементы массива на новые
        guard elements.count == new.count else {return}
        for idx in 0..<new.count {
            if let indexMatched = self.index(of: elements[idx]){
                self [indexMatched ] = new[idx]
            }
        }
    }

    func indices(of elements: [Element]) ->[Int] {
        guard self.count >= elements.count, elements.count > 0 else { return [] }
        /// Ищем индексы элементов elements у себя - self
        return elements.map{self.index(of: $0)}.flatMap{$0}
    }
}
