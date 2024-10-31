//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftData

extension ModelContainer {

  /// A shared instance of ``ModelContainer`` that is used to manage the app's SwiftData entities.
  /// - Warning: Must be initialized within a `.modelContainer(_:)` in the ``CatLoverApp``.
  static let shared: ModelContainer = {
    do {
      return try ModelContainer(
        for: BreedEntity.self,
        BreedImageEntity.self
      )
    } catch {
      fatalError("Failed to create `ModelContainer` for the entities: \(error)")
    }
  }()
}
