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
    sut = BreedImageEntity(with: .fake(), breedID: "123-abc")
  }

  deinit {
    sut = .none
    container = .none
  }

  @Test func initializedWithBreedImageData_valuesAreCorrectlySet() throws {
    let expectedData = BreedImageData.fake()
    let expectedBreedID = "123-abc"
    sut = BreedImageEntity(with: expectedData, breedID: expectedBreedID)

    let result = try #require(sut)

    #expect(result.breedImageID == expectedData.id)
    #expect(result.imageURL == expectedData.url)
    #expect(result.breedID == expectedBreedID)
  }
}
