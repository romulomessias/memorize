//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Romulo Messias on 26/06/20.
//  Copyright © 2020 Romulo Messias. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var memoryGame: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var numberOfPairs : Int {
        print(memoryGame.cards.count / 2)
        return memoryGame.cards.count / 2
    }
    
    static func createMemoryGame () -> MemoryGame<String> {
        var emojis: [String] = ["👻", "🎃", "🕷", "🕯", "🦇", "🏰", "🍭", "💀", "👽", "🎉"]
        let numberOfPairs = Int.random(in: 2...5)
        emojis.shuffle()
        
        print(numberOfPairs)
        return MemoryGame(numberOfPairCards: numberOfPairs) { index in
            emojis[index]
        }
    }
    
    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        memoryGame.cards
    }
    
    // MARK: Intents
    
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
