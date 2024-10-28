//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ServerMock: ServerProtocol {

  // Mock values
  /// Passed inside ``ServerMock`` protocol methods to simulate work being performed during
  /// asynchronous requests.
  var onPerformAsyncAwait: () throws -> Void = {}

  let urlSessionMock: any URLSessionProtocol

  init(urlSessionMock: any URLSessionProtocol) {
    self.urlSessionMock = urlSessionMock
  }

  // Protocol requirements
  func get<T: Codable>(
    _ dataType: T.Type,
    atEndpoint endpoint: ServerEndpoint
  ) async throws -> T {
    try onPerformAsyncAwait()

    let requestFake = URLRequest(url: URL(string: "https://fake.api.request.com")!)
    let (data, _) = try await urlSessionMock.data(for: requestFake)
    let decodedData = try JSONDecoder().decode(dataType, from: data)
    return decodedData
  }
}
