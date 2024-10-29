//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation
import SwiftData

@Observable final class BreedsListViewModel {

  @ObservationIgnored @Injected(\.server) private var server

  var breeds: [BreedModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedsListViewModel {

  @MainActor func getBreeds() async {
    isLoading = true
    defer { isLoading = false }

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
