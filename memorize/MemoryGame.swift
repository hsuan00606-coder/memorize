//
//  MemoryGame.swift
//  memorize
//
//  Created by 11127242 on 2026/3/30.
//

import Foundation

func createCardContent(Index: Int) -> String {
    return "A"
}

struct MemoryGame <CardContent>{
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            var cardContent: CardContent = createCardContent(index)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }  // end for
    }  // end init
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent  // 現在無法決定
    }
}
