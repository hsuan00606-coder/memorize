//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11127242 on 2026/3/30.
//

import Foundation

@Observable
class EmojiMemoryGame {
    
    // static: 全ＡＰＰ共用一份
    private static var emojis = ["🛜", "📅", "📂", "📨", "⌨️", "🁮", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: {index in EmojiMemoryGame.emojis[index] })
    }
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - intent
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
