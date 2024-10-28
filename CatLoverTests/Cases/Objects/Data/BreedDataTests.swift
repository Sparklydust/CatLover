//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import Testing
@testable import CatLover

struct BreedDataTests {

  @Test func requestBreedData_jsonResponseIsSuccessfullyDecoded() throws {
    let expected: BreedData = .fake()
    let data = try ResourceLoader.jsonFake(.breedData)

    let result = try JSONDecoder().decode(BreedData.self, from: data)

    #expect(result == expected, "Decoded `BreedData` must be equal to the `BreedData.json` file content.")
  }
}
