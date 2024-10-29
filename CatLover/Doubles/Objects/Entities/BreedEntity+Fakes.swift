//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import SwiftData

// Setup fake data for unit tests when initializing ``BreedEntity``.

extension BreedEntity {

  /// Create fake ``BreedEntity`` object for unit tests.
  /// Returns: Initialized object with fake data.
  static func fake(
    with data: BreedData = .fake()
  ) -> BreedEntity {
    .init(
      with: data
    )
  }
}

// MARK: - Previews
extension BreedEntity {

  /// Creates a fake ``ModelContainer`` with a ``BreedEntity`` inserted, for previews.
  /// - Returns: A ``ModelContainer`` configured for in-memory use with the fake entity inserted.
  /// - Throws: An error if the ``ModelContainer`` cannot be created.
  @MainActor static func fakeContainer(
    entities: [BreedEntity] = [BreedEntity.fake()]
  ) throws -> ModelContainer {
    do {
      let container = try ModelContainer(
        for: BreedEntity.self,
        configurations: .init(isStoredInMemoryOnly: true)
      )
      entities.forEach { container.mainContext.insert($0) }

      return container
    } catch {
      fatalError("A fake `BreedEntity` must be created within the preview.")
    }
  }
}

// MARK: - Unit Tests
extension BreedEntity {

  /// A static property to hold a fake ``ModelContext`` for internal use during unit testing.
  ///
  /// This property should not be accessed directly in tests. Instead, use `modelContext` which will
  /// return this context when it's set up during tests.
  @MainActor static var internalFakeContext: ModelContext?

  /// Sets up a fake ``ModelContext`` for unit testing.
  ///
  /// This method creates an in-memory ``ModelContext`` and assigns it to `modelContextFake`.
  /// It allows for an optional closure to insert entities into the context, which is useful for
  /// preparing test scenarios with pre-existing data.
  /// ## Example Usage:
  /// ```swift
  /// // Setup the fake context with entities for tests
  /// let fakeContext = BreedEntity.fakeContext { context in
  ///   let entity = BreedEntity.fake()
  ///   context.insert(entity)
  /// }
  /// ```
  /// - Parameter insertEntities: A closure that takes a ``ModelContext`` and allows you to insert
  ///   entities into the fake context. By default, this closure does nothing.
  /// - Returns: The fake ``ModelContext`` that has been set up.
  /// - Note: This method must be called on the main thread, as indicated by the `@MainActor` attribute.
  @MainActor static func fakeContext(
    insertEntities: (ModelContext) -> Void = { _ in }
  ) -> ModelContext {
    do {
      let fakeContext = try ModelContainer(
        for: BreedEntity.self,
        configurations: .init(isStoredInMemoryOnly: true)
      ).mainContext
      BreedEntity.internalFakeContext = fakeContext

      insertEntities(fakeContext)
      return fakeContext
    } catch {
      fatalError("Failed to create `ModelContext` for `BreedEntity`: \(error)")
    }
  }
}

