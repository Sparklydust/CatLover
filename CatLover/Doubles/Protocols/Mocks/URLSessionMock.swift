//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class URLSessionMock: URLSessionProtocol {

  // Mock values
  var dataStub: Data? = .none
  var responseStub: URLResponse? = .none
  var errorStub: ServerError? = .none

  init(
    data: Data? = .none,
    response: URLResponse? = .none,
    error: ServerError? = .none
  ) {
    dataStub = data
    responseStub = response
    errorStub = error
  }

  // Protocol requirements
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse) {
    guard errorStub == .none,
          let dataStub,
          let responseStub
    else { throw errorStub ?? .requestFails }

    return (dataStub, responseStub)
  }

  func data(from url: URL) async throws -> (Data, URLResponse) {
    guard errorStub == .none,
          let dataStub,
          let responseStub
    else { throw errorStub ?? .requestFails }

    return (dataStub, responseStub)
  }
}
