//
//  ContentViewModel.swift
//  Example
//
//  Created by Matheus Gois on 05/04/24.
//

import SwiftData
import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        var modelContext: ModelContext
        var items = [Item]()

        required init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }

        func addItem() {
            withAnimation {
                let newItem = Item(timestamp: Date())
                modelContext.insert(newItem)
                fetchData()
            }
        }

        func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    modelContext.delete(items[index])
                }
                fetchData()
            }
        }

        func fetchData() {
            do {
                let descriptor = FetchDescriptor<Item>(sortBy: [.init(\.timestamp)])
                items = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed!!")
            }
        }
    }
}
