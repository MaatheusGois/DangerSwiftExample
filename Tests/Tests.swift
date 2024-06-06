//
//  Tests.swift
//  Tests
//
//  Created by Matheus Gois on 06/06/24.
//

import XCTest
import SwiftData
@testable import Example

extension ContentView.ViewModel: ViewModelTestable {}

final class ViewModelTests: XCTestCase {
    @MainActor func testAppStartsEmpty() throws {
        // Given
        let sut = try make(
            viewModel: ContentView.ViewModel.self
        )

        // When & Then
        XCTAssertEqual(
            sut.items.count,
            0,
            "There should be 0 items when the app is first launched."
        )
    }

    @MainActor func testCreatingSamplesWorks() throws {
        // Given
        let sut = try make(
            viewModel: ContentView.ViewModel.self
        )

        // When
        sut.addItem()
        sut.addItem()
        sut.addItem()

        // Then
        XCTAssertEqual(
            sut.items.count,
            3,
            "There should be 3 items after adding sample data."
        )
    }

    @MainActor func testCreaatingAndRemoving() throws {
        // Given
        let sut = try make(
            viewModel: ContentView.ViewModel.self
        )

        // When
        sut.addItem()
        sut.addItem()
        sut.deleteItems(
            offsets: .init(
                integer: 0
            )
        )

        // Then
        XCTAssertEqual(
            sut.items.count,
            1,
            "There should be 1 items after adding sample data."
        )
    }
}

// MARK: - Helpers

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
