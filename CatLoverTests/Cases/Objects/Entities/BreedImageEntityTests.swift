//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import SwiftData
import Testing
@testable import CatLover

final class BreedImageEntityTests {

  var sut: BreedImageEntity!

  var container: ModelContainer!

  init() throws {
    container = try ModelContainer(
      for: BreedImageEntity.self,
      configurations: .init(isStoredInMemoryOnly: true)
    )
    sut = BreedImageEntity(with: .fake())
  }

  deinit {
    sut = .none
    container = .none
  }

  @Test func initializedWithBreedImageData_valuesAreCorrectlySet() throws {
    let expected = BreedImageData.fake()
    sut = BreedImageEntity(with: expected)

    let result = try #require(sut)

    #expect(result.breedImageID == expected.id)
    #expect(result.imageURL == expected.url)
  }
}
