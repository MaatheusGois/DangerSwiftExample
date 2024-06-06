//
//  Tests.Helpers.swift
//  Example
//
//  Created by Matheus Gois on 05/04/24.
//

import XCTest
import SwiftData
@testable import Example

protocol ViewModelTestable {
    init(
        modelContext: ModelContext
    )
}

extension XCTestCase {
    @MainActor func make<T: ViewModelTestable>(
        viewModel: T.Type
    ) throws -> T {
        let config = ModelConfiguration(
            isStoredInMemoryOnly: true
        )
        let container = try ModelContainer(
            for: Item.self,
            configurations: config
        )
        return T(
            modelContext: container.mainContext
        )
    }
}
