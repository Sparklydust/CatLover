//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ServerSpy: ServerProtocol {

  // Spy values
  var isGetCalled = false
  var endpoint: ServerEndpoint?
  var data: (any Codable)?

  // Protocol requirements
  func get<T: Codable>(
    _ data: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T {
    isGetCalled = true
    self.endpoint = endpoint
    self.data = data as? any Codable

    throw ServerError.requestFails
  }
}
