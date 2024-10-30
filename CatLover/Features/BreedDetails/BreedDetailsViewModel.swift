//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

@Observable final class BreedDetailsViewModel {

  var breedImages: [BreedImageModel] = []
  var isLoading = false
  var showError = false
}

// MARK: - Server Request
extension BreedDetailsViewModel {

  @MainActor func getBreedImages(for breedID: String) async {
    // Intentionally empty
  }
}
