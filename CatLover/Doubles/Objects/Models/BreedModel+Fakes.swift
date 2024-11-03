//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

extension BreedModel {

  /// Create fake ``BreedModel`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    with data: BreedData = .fake()
  ) -> BreedModel {
    .init(
      with: data
    )
  }
}
