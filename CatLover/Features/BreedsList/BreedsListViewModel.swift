//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

@Observable final class BreedsListViewModel {

  @ObservationIgnored @Injected(\.server) private var server

  var breeds: [BreedModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedsListViewModel {

  func getBreeds() async {
    isLoading = true
    defer { isLoading = false }

    do {
      let data = try await server.get([BreedData].self, atEndpoint: .breedsList)
      breeds = data.map { BreedModel(with: $0) }
    } catch {
      // Intentionally empty
    }
  }
}
