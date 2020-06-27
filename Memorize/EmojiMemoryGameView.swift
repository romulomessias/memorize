//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Romulo Messias on 25/06/20.
//  Copyright © 2020 Romulo Messias. All rights reserved.
//

import SwiftUI


struct EmojiMemoryGameView: View {
   @ObservedObject var memoryGame: EmojiMemoryGame
    var body: some View {
        HStack () {
            ForEach(memoryGame.cards, content:  { card in
                CardView(card: card)
                    .onTapGesture {
                        self.memoryGame.choose(card: card)
                }
            })
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(memoryGame.numberOfPairs < 5 ? Font.largeTitle : Font.body)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View  {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }.aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(memoryGame: EmojiMemoryGame())
    }
}
