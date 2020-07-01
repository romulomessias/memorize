//
//  MemoryGame.swift
//  Memorize
//
//  Created by Romulo Messias on 26/06/20.
//  Copyright © 2020 Romulo Messias. All rights reserved.
//

import Foundation

struct MemoryGame<CardConent: Equatable> {
    var cards: Array<Card>
    
    var indexOfFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairCards: Int, cardContentFactory: (Int) -> CardConent) {
        cards = []
        for pairIndex in 0..<numberOfPairCards {
            let content = cardContentFactory(pairIndex)
            let index = pairIndex * 2
            cards.append(Card(id: index,isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(id: index+1, isFaceUp: false, isMatched: false, content: content))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card) -> Void {
        if let choseIndex = index(of: card), !cards[choseIndex].isFaceUp, !cards[choseIndex].isMatched {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[choseIndex].content == cards[potentialMatchIndex].content {
                    cards[choseIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
//                    cards[choseIndex].isFaceUp = false
//                    cards[potentialMatchIndex].isFaceUp = false
                }
//                if !cards[choseIndex].isMatched {
//                    cards[choseIndex].isFaceUp = true
//                }
                
            } else {
                indexOfFaceUpCard = choseIndex
            }
            
            
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
