//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

extension BreedImageData {

  /// Create fake ``BreedImageData`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    id: String = "N-94oSJ5T",
    url: String = "breedFake03"
  ) -> BreedImageData {
    .init(
      id: id,
      url: url
    )
  }
}
