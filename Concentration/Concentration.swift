//
//  Concentration.swift
//  Concentration
//
//  Created by Dmitry Reshetnik on 13.01.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flips: Int = 0
    var score: Int = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2 // TODO: Make normal score counting
                } else {
                    if cards[matchIndex].isPreviouslySeen || cards[index].isPreviouslySeen {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                cards[index].isPreviouslySeen = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        flips += 1
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards.
        cards.shuffle()
    }
    
}
