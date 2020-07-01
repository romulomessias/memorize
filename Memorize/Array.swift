//
//  Array.swift
//  Memorize
//
//  Created by Romulo Messias on 30/06/20.
//  Copyright © 2020 Romulo Messias. All rights reserved.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
