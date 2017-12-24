//
//  Theme.swift
//  Concentration
//
//  Created by Gleb on 24.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import Foundation

struct Theme {
    let name: String
    var emojiChoises: [String]
}


struct ThemeFactory {
    private let themes = [Theme(name: "Faces", emojiChoises: ["😀", "😃", "😅", "😂", "😘", "😉", "😡", "😱", "😜", "😝"]),
                          Theme(name: "Animals", emojiChoises: ["🐶", "🐱", "🐭", "🐷", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯"]),
                          Theme(name: "Plants", emojiChoises: ["🌵", "🎄", "🌳", "🌴", "🌼", "🍁", "☘️", "🍄", "🌹", "🌸"]),
                          Theme(name: "Food", emojiChoises: ["🍏", "🍌", "🍉", "🌶", "🍇", "🍖", "🧀", "🥕", "🥖", "🍓"]),
                          Theme(name: "Sports", emojiChoises: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸"]),
                          Theme(name: "Vehicles", emojiChoises: ["🚗", "🚎", "🚚", "🚜", "🏍", "🚠", "🚃", "🚁", "🚀", "🛳"])]

    func getRandomTheme() -> Theme {
        return themes[Int(arc4random_uniform(UInt32(themes.count)))]
    }
}
