//
//  Theme.swift
//  Concentration
//
//  Created by Gleb on 24.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    let name: String
    var emojiChoises: [String]
    let viewBackgroundColor: UIColor
    let backOfCardColor: UIColor
}


struct ThemeFactory {
    private let themes = [Theme(name: "Faces", emojiChoises: ["😀", "😃", "😅", "😂", "😘", "😉", "😡", "😱", "😜", "😝"], viewBackgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), backOfCardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                          Theme(name: "Animals", emojiChoises: ["🐶", "🐱", "🐭", "🐷", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯"], viewBackgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), backOfCardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                          Theme(name: "Plants", emojiChoises: ["🌵", "🎄", "🌳", "🌴", "🌼", "🍁", "☘️", "🍄", "🌹", "🌸"], viewBackgroundColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), backOfCardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                          Theme(name: "Food", emojiChoises: ["🍏", "🍌", "🍉", "🌶", "🍇", "🍖", "🧀", "🥕", "🥖", "🍓"], viewBackgroundColor: #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1), backOfCardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                          Theme(name: "Sports", emojiChoises: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸"], viewBackgroundColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), backOfCardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                          Theme(name: "Vehicles", emojiChoises: ["🚗", "🚎", "🚚", "🚜", "🏍", "🚠", "🚃", "🚁", "🚀", "🛳"], viewBackgroundColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), backOfCardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]

    func getRandomTheme() -> Theme {
        return themes[Int(arc4random_uniform(UInt32(themes.count)))]
    }
}
