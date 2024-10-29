//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct BreedModelTests {

  @Test func initialization_withBreedData_allBreedModelValuesAreSet() {
    let expected: BreedData = .fake()

    let result = BreedModel(with: expected)

    #expect(result.id == expected.id)
    #expect(result.name == expected.name)
    #expect(result.origin == expected.origin)
    #expect(result.temperament == expected.temperament)
    #expect(result.description == expected.description)
    #expect(result.lifeSpan == expected.lifeSpan)
    #expect(result.imageURL == expected.image?.url)
  }


  @Test func initialization_withBreedEntity_allBreedModelValuesAreSet() {
    let expected: BreedEntity = .fake()

    let result = BreedModel(with: expected)

    #expect(result.id == expected.breedID)
    #expect(result.name == expected.name)
    #expect(result.origin == expected.origin)
    #expect(result.temperament == expected.temperament)
    #expect(result.description == expected.info)
    #expect(result.lifeSpan == expected.lifeSpan)
    #expect(result.imageURL == expected.imageURL)
  }
}
