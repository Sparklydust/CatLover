//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import SwiftData

@Model final class BreedImageEntity {

  @Attribute(.unique) var breedImageID: String
  var url: String
  var breedID: String

  init(with data: BreedImageData, breedID: String) {
    self.breedImageID = data.id
    self.url = data.url
    self.breedID = breedID
  }
}

// MARK: - Model Context
extension BreedImageEntity {

  /// Provides the shared context for the ``BreedImageEntity`` model.
  ///
  /// This static property creates a ``ModelContainer`` for the ``BreedImageEntity`` type and
  /// retrieves its `mainContext`. The context is used for managing and interacting with instances of
  /// ``BreedImageEntity``.
  /// - Note: This property is isolated to the main actor, ensuring that all interactions with the
  /// `mainContext` occur on the main thread, maintaining thread safety.
  /// - Warning: `internalFakeContext` is for Unit Tests only. Do not use in production code.
  @MainActor static var modelContext: ModelContext {
    guard internalFakeContext == .none else { return internalFakeContext! }
    return ModelContainer.shared.mainContext
  }
}
