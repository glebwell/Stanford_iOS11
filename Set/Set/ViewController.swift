//
//  ViewController.swift
//  Set
//
//  Created by Gleb on 18.01.18.
//  Copyright © 2018 Gleb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [BorderButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtonsFromModel()
    }

    private func updateButtonsFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            button.setTitle(String(index), for: .normal)
            if index < 12 {
                button.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            }
        }
    }

}

