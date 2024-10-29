//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftData
import Testing
@testable import CatLover

final class BreedEntityTests {

  var sut: BreedEntity!

  var container: ModelContainer!

  init() throws {
    container = try ModelContainer(
      for: BreedEntity.self,
      configurations: .init(isStoredInMemoryOnly: true)
    )
    sut = BreedEntity(with: .fake())
  }

  deinit {
    sut = .none
    container = .none
  }
}
