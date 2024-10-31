//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

struct ServerErrorTests {

  @Test func requestFails_existsAsAServerErrorCase() async throws {
    let result = ServerError.requestFails

    #expect(result != nil)
  }

  @Test func urlConstructionFails_existsAsAServerErrorCase() async throws {
    let result = ServerError.urlConstructionFails

    #expect(result != nil)
  }
}
