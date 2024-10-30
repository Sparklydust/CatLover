//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

@Observable final class BreedDetailsViewModel {

  @ObservationIgnored @Injected(\.server) private var server

  private var page: Int = .zero
  private var hasMorePage = true

  var breedImages: [BreedImageModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedDetailsViewModel {

  @MainActor func getBreedImages(for breedID: String) async {
    guard !isLoading, hasMorePage else { return }
    isLoading = true
    defer { isLoading = false }

    do {
      let data = try await server.get([BreedImageData].self, atEndpoint: .breedImages(page: page))
      let newImages = data.compactMap { BreedImageModel(with: $0) }
      breedImages.append(contentsOf: newImages)
      page += 1
      hasMorePage = !newImages.isEmpty
    } catch {
      // Intentionally empty
    }
  }
}
