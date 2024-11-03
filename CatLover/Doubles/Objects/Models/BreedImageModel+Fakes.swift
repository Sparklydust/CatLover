//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

extension BreedImageModel {

  /// Create fake ``BreedImageModel`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    with data: BreedImageData = .fake()
  ) -> BreedImageModel {
    .init(
      with: data
    )
  }
}
