//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

@Observable final class BreedDetailsViewModel {

  @ObservationIgnored @Injected(\.server) private var server

  private var page: Int = .zero
  private var limitPerPage = 20
  private var canLoadMore: Bool {
    !isLoading && breedImages.count % limitPerPage == .zero
  }

  var breedImages: [BreedImageModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedDetailsViewModel {

  @MainActor func getBreedImages(for breedID: String) async {
    guard canLoadMore else { return }
    isLoading = true
    defer { isLoading = false }

    do {
      let data = try await server.get(
        [BreedImageData].self,
        atEndpoint: .breedImages(breedID: breedID, page: page, limitPerPage: limitPerPage)
      )
      let newImages = data.compactMap { BreedImageModel(with: $0) }
      breedImages.append(contentsOf: newImages)
      newImages.count < limitPerPage ? (page = -1) : (page += 1)
    } catch {
      // Intentionally empty
    }
  }
}
