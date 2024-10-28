//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class URLSessionMock: URLSessionProtocol {

  // Mock values
  var data: Data?
  var response: URLResponse?
  var error: ServerError?

  init(
    data: Data? = .none,
    response: URLResponse? = .none,
    error: ServerError? = .none
  ) {
    self.data = data
    self.response = response
    self.error = error
  }

  // Protocol requirements
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse) {
    guard error == .none,
          let httpResponse = response as? HTTPURLResponse,
          let data = data,
          let response = response
    else { throw error ?? .requestFails }

    return (data, response)
  }
}
