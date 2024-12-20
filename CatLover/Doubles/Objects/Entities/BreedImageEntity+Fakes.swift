//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import SwiftData

// Setup fake data for unit tests when initializing ``BreedImageEntity``.

extension BreedImageEntity {

  /// Create fake ``BreedImageEntity`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    with data: BreedImageData = .fake(),
    breedID: String = "123-abc"
  ) -> BreedImageEntity {
    .init(
      with: data,
      breedID: breedID
    )
  }
}

// MARK: - Previews
extension BreedImageEntity {

  /// Creates a fake ``ModelContainer`` with a ``BreedImageEntity`` inserted, for previews.
  /// - Returns: A ``ModelContainer`` configured for in-memory use with the fake entity inserted.
  /// - Throws: An error if the ``ModelContainer`` cannot be created.
  @MainActor static func fakeContainer(
    entities: [BreedImageEntity] = [BreedImageEntity.fake()]
  ) throws -> ModelContainer {
    do {
      let container = try ModelContainer(
        for: BreedImageEntity.self,
        configurations: .init(isStoredInMemoryOnly: true)
      )
      entities.forEach { container.mainContext.insert($0) }

      return container
    } catch {
      fatalError("A fake `BreedImageEntity` must be created within the preview.")
    }
  }
}

// MARK: - Unit Tests
extension BreedImageEntity {

  /// A static property to hold a fake ``ModelContext`` for internal use during unit testing.
  ///
  /// This property should not be accessed directly in tests. Instead, use `modelContext` which will
  /// return this context when it's set up during tests.
  @MainActor static var internalFakeContext: ModelContext?

  /// Sets up a fake ``ModelContext`` for unit testing.
  ///
  /// This method creates an in-memory ``ModelContext`` and assigns it to `modelContextFake`.
  /// - Returns: The fake ``ModelContext`` that has been set up.
  /// - Note: This method must be called on the main thread, as indicated by the `@MainActor` attribute.
  @MainActor static func fakeContext() -> ModelContext {
    do {
      let fakeContext = try ModelContainer(
        for: BreedImageEntity.self,
        configurations: .init(isStoredInMemoryOnly: true)
      ).mainContext
      BreedImageEntity.internalFakeContext = fakeContext

      return fakeContext
    } catch {
      fatalError("Failed to create `ModelContext` for `BreedImageEntity`: \(error)")
    }
  }
}
