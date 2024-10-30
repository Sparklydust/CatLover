//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

@Observable final class BreedDetailsViewModel {

  @ObservationIgnored @Injected(\.server) private var server

  var breedImages: [BreedImageModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedDetailsViewModel {

  @MainActor func getBreedImages(
    for breedID: String,
    atPage page: Int
  ) async {
    isLoading = true
    defer { isLoading = false }

    do {
      let data = try await server.get([BreedImageData].self, atEndpoint: .breedImages(page: page))
      breedImages = data.compactMap { BreedImageModel(with: $0) }
    } catch {
      // Intentionally empty
    }
  }
}
