//
//  Tests_CITests.swift
//  Tests-CITests
//
//  Created by Matheus Gois on 05/04/24.
//

import XCTest
import SwiftData
@testable import Tests_CI

extension ContentView.ViewModel: ViewModelTestable {}

final class ContentViewViewModelTests: XCTestCase {
    @MainActor func testAppStartsEmpty() throws {
        // Given
        let sut = try make(viewModel: ContentView.ViewModel.self)

        // When & Then
        XCTAssertEqual(sut.items.count, 0, "There should be 0 items when the app is first launched.")
    }

    @MainActor func testCreatingSamplesWorks() throws {
        // Given
        let sut = try make(viewModel: ContentView.ViewModel.self)

        // When
        sut.addItem()
        sut.addItem()
        sut.addItem()

        // Then
        XCTAssertEqual(sut.items.count, 3, "There should be 3 items after adding sample data.")
    }

    @MainActor func testCreaatingAndRemoving() throws {
        // Given
        let sut = try make(viewModel: ContentView.ViewModel.self)

        // When
        sut.addItem()
        sut.addItem()
        sut.deleteItems(offsets: .init(integer: 0))

        // Then
        XCTAssertEqual(sut.items.count, 1, "There should be 1 items after adding sample data.")
    }
}
