//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

final class ServerService: ServerProtocol {

  @Injected(\.urlSession) private var urlSession
}

// MARK: - Requests
extension ServerService {

  func get<T: Codable>(
    _ data: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T {

    guard let url = endpoint.url else { throw ServerError.urlConstructionFails }
    let (data, response) = try await urlSession.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode
    else { throw ServerError.requestFails }

    return try JSONDecoder().decode(T.self, from: data)
  }
}
