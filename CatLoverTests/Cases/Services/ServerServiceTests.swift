//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

@Suite(.serialized)
final class ServerServiceTests: BaseTestCase, @unchecked Sendable {

  override init() {
    super.init()
  }

  @Test func requestIsSuccessful_requestedDataIsReturned() async throws {
    #expect(false == true, "Test not yet implemented")
  }

  @Test func requestIsNoSuccessful_serverErrorIsReturned() async throws {
    #expect(false == true, "Test not yet implemented")
  }
}
