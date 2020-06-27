//
//  MemoryGame.swift
//  Memorize
//
//  Created by Romulo Messias on 26/06/20.
//  Copyright © 2020 Romulo Messias. All rights reserved.
//

import Foundation

struct MemoryGame<CardConent> {
    var cards: Array<Card>
    
    init(numberOfPairCards: Int, cardContentFactory: (Int) -> CardConent) {
        cards = []
        for pairIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(pairIndex)
            let index = pairIndex * 2
            cards.append(Card(id: index,isFaceUp: true, isMatched: false, content: content))
            cards.append(Card(id: index+1, isFaceUp: true, isMatched: false, content: content))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card) -> Void {
        if let choseIndex = index(of: card) {
            cards[choseIndex].isFaceUp = !card.isFaceUp
        }
    }
    
    func index(of card: Card) -> Int? {
        return cards.firstIndex(where: { $0.id == card.id})
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardConent
    }
}
