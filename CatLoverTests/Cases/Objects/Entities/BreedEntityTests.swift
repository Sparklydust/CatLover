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

  @Test func initializedWithBreedData_valuesAreCorrectlySet() throws {
    let expected = BreedData.fake()
    sut = BreedEntity(with: expected)

    let result = try #require(sut)

    #expect(result.breedID == expected.id)
    #expect(result.name == expected.name)
    #expect(result.origin == expected.origin)
    #expect(result.temperament == expected.temperament)
    #expect(result.info == expected.description)
    #expect(result.lifeSpan == expected.lifeSpan)
    #expect(result.imageURL == expected.image?.url)
  }
}
