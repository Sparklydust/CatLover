//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import SwiftData

@Model final class BreedEntity {

  @Attribute(.unique) var breedID: String
  var name: String
  var origin: String
  var temperament: String
  var info: String
  var lifeSpan: String
  var imageURL: String?

  init(with data: BreedData) {
    self.breedID = data.id
    self.name = data.name
    self.origin = data.origin
    self.temperament = data.temperament
    self.info = data.description
    self.lifeSpan = data.lifeSpan
    self.imageURL = data.image?.url
  }
}

// MARK: - Model Context
extension BreedEntity {

  /// Provides the shared context for the ``BreedEntity`` model.
  ///
  /// This static property creates a ``ModelContainer`` for the ``BreedEntity`` type and
  /// retrieves its `mainContext`. The context is used for managing and interacting with instances of
  /// ``BreedEntity``.
  /// - Note: This property is isolated to the main actor, ensuring that all interactions with the
  /// `mainContext` occur on the main thread, maintaining thread safety.
  /// - Warning: `internalFakeContext` is for Unit Tests only. Do not use in production code.
  @MainActor static var modelContext: ModelContext {
    guard internalFakeContext == .none else { return internalFakeContext! }
    return ModelContainer.shared.mainContext
  }
}
