//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct String_FileNameTests {

  @Test func imageNameAssigned_returnImageName() async throws {
    let fakeName = ["http://example.com/thumb/image.png": "thumb-image.png"]

    for (result, expected) in fakeName {
      #expect(result.extractedFileName == expected)
    }
  }
}
