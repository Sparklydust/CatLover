//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation

final actor ServerService: ServerProtocol {

  @Injected(\.urlSession) private var urlSession
}

// MARK: - Requests
extension ServerService {

  func get<T: Codable & Sendable>(
    _ data: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T {

    guard let url = endpoint.url else { throw ServerError.urlConstructionFails }
    guard let apiKey = Bundle.main.catAPIKey, !apiKey.isEmpty
    else { throw ServerError.apiKeyMissing }

    var request = URLRequest(url: url)
    request.setValue(apiKey, forHTTPHeaderField: "x-api-key")

    let (data, response) = try await urlSession.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode
    else { throw ServerError.requestFails }

    return try JSONDecoder().decode(T.self, from: data)
  }
}
