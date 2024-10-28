//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct BreedModelTests {

  @Test func initializationWithBreedData_allBreedModelValuesAreSet() async throws {
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
}
