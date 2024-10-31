//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ServerDummy: ServerProtocol {

  // Protocol requirements
  func get<T: Codable>(
    _ data: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T {
    throw ServerError.requestFails
  }
}
