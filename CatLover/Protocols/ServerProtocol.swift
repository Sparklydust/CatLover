//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

/// Server contract for requesting data on the ClipShop server.
protocol ServerProtocol: Sendable {

  /// Initiates a network request to the specified server endpoint, expecting a response of the given
  /// data type.
  /// - Parameters:
  ///   - data: The type of the expected response data.
  ///   - endpoint: The ``ServerEndpoint`` URL to request the data.
  /// - Returns: An instance of the requested data.
  /// - Throws: An error if the request fails.
  func get<T: Codable & Sendable>(
    _ data: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T
}
