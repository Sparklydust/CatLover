//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct BreedImageModelTests {

  @Test func initializationWithBreedImageData_allBreedImageModelValuesAreSet() {
    let expected: BreedImageData = .fake()

    let result = BreedImageModel(with: expected)

    #expect(result.id == expected.id)
    #expect(result.url == expected.url)
  }

  @Test func initializationWithBreedImageEntity_allBreedImageModelValuesAreSet() {
    let expected: BreedImageEntity = .fake()

    let result = BreedImageModel(with: expected)

    #expect(result.id == expected.breedImageID)
    #expect(result.url == expected.url)
  }
}
