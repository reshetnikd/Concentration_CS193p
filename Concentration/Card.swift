//
//  Card.swift
//  Concentration
//
//  Created by Dmitry Reshetnik on 13.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var isInvolvedInMismatch: Bool = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
