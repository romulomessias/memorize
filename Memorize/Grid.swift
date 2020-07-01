//
//  Grid.swift
//  Memorize
//
//  Created by Romulo Messias on 28/06/20.
//  Copyright © 2020 Romulo Messias. All rights reserved.
//

import SwiftUI
import Foundation

struct Grid<Item : Identifiable, ItemView: View>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View  {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body (for item: Item, in layout: GridLayout) -> some View {
        let index = self.items.firstIndex(where: { $0.id == item.id })!
        
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}
