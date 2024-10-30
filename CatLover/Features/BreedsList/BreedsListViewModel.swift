//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import SwiftData
import UIKit

@Observable final class BreedsListViewModel {

  @ObservationIgnored @Injected(\.server) private var server
  private var breeds: [BreedModel] = [] {
    didSet { updateFilteredBreeds() }
  }

  var filteredBreeds: [BreedModel] = []
  var isLoading = false
  var searchText = String() {
    didSet { updateFilteredBreeds() }
  }
  var showError = false
}

// MARK: - Search
extension BreedsListViewModel {

  private func updateFilteredBreeds() {
    if searchText.isEmpty {
      filteredBreeds = breeds
    } else {
      filteredBreeds = breeds.filter {
        $0.name.lowercased().contains(searchText.lowercased())
      }
    }
  }
}

// MARK: - Server Request
extension BreedsListViewModel {

  /// Fetches the list of breeds from the server and updates the local state.
  @MainActor func getBreeds() async {
    isLoading = true
    defer { isLoading = false }
    breeds.removeAll()

    do {
      let data = try await server.get([BreedData].self, atEndpoint: .breedsList)
      breeds = data.map { BreedModel(with: $0) }
      data.forEach { BreedEntity.modelContext.insert(BreedEntity(with: $0)) }
    } catch {
      loadCachedBreeds()
    }
  }

  @MainActor private func loadCachedBreeds() {
    try? BreedEntity
      .modelContext
      .fetch(FetchDescriptor<BreedEntity>())
      .forEach { breeds.append(BreedModel(with: $0)) }
    guard breeds.isEmpty else { return }
    showError = true
  }
}
