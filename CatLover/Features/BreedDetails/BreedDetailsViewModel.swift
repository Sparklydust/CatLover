//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation
import SwiftData

@Observable final class BreedDetailsViewModel {

  @ObservationIgnored @Injected(\.server) private var server

  private var page: Int = .zero
  private var limitPerPage = 20
  /// Determines if more images can be loaded based on the current state.
  private var canLoadMore: Bool {
    !isLoading && breedImages.count % limitPerPage == .zero
  }

  var breedImages: [BreedImageModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedDetailsViewModel {

  /// Fetches breed images from the server and appends them to the list.
  /// - Parameter breedID: The unique identifier of the breed to fetch images for.
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
      newImages.count < limitPerPage ? (page = -1) : (page += 1) // Stops or continue pagination
      data.forEach {
        BreedImageEntity.modelContext.insert(BreedImageEntity(with: $0, breedID: breedID))
      }
    } catch {
      loadCachedBreedImages(for: breedID)
    }
  }

  @MainActor private func loadCachedBreedImages(for breedID: String) {
    breedImages.removeAll()

    let fetchRequest = FetchDescriptor<BreedImageEntity>(
      predicate: #Predicate { $0.breedID == breedID }
    )
    try? BreedImageEntity
      .modelContext
      .fetch(fetchRequest)
      .forEach { breedImages.append(BreedImageModel(with: $0)) }

    guard breedImages.isEmpty else { return }
    showError = true
  }
}
