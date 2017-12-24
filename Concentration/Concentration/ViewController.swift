//
//  ViewController.swift
//  Concentration
//
//  Created by Admin on 19.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var themeNameLabel: UILabel!

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }

    @IBAction func startNewGame(_ sender: UIButton) {
        theme = themeFactory.getRandomTheme()
        emoji.removeAll()
        game.startNewGame()
        updateViewFromModel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        theme = themeFactory.getRandomTheme()
    }

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    private let themeFactory = ThemeFactory()
    private var theme: Theme? {
        didSet {
            themeNameLabel.text = theme?.name ?? "Not Set"
        }
    }

    private var emoji = [Int: String]()

    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, theme != nil, !theme!.emojiChoises.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(theme!.emojiChoises.count)))
            emoji[card.identifier] = theme!.emojiChoises.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

