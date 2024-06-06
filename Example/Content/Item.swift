//
//  Item.swift
//  Example
//
//  Created by Matheus Gois on 05/04/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
