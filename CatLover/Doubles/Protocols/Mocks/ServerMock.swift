//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ServerMock: ServerProtocol {

  // Mock values
  /// Pass inside ``ServerMock`` protocol methods to catch up works being perform during
  /// asynchronous requests.
  ///
  /// Used to unit tests asynchronous methods by stopping the work of an async/await work.
  var onPerformAsyncAwait: () throws -> Void = {}

  // Protocol requirements
  func get<T: Codable>(
    _ data: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T {
    try onPerformAsyncAwait()

    throw ServerError.requestFails
  }
}
