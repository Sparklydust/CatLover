//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import Testing
@testable import CatLover

struct BreedImageDataTests {

  @Test func requestBreedImageData_jsonResponseIsSuccessfullyDecoded() throws {
    let expected: BreedImageData = .fake()
    let data = try ResourceLoader.jsonFake(.breedImageData)

    let result = try JSONDecoder().decode(BreedImageData.self, from: data)

    #expect(result == expected, "Decoded `BreedImageData` must be equal to the `BreedImageData.json` file content.")
  }
}
