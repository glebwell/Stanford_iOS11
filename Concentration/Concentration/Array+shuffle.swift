//
//  Array+shuffle.swift
//  Concentration
//
//  Created by Gleb on 23.12.17.
//  Copyright © 2017 gleb.maltcev. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffle() {
        var lastIndex = self.count - 1
        while (lastIndex > 0)
        {
            let randIndex = Int(arc4random_uniform(UInt32(lastIndex)))
            self.swapAt(lastIndex, randIndex)
            lastIndex -= 1
        }
    }
}
