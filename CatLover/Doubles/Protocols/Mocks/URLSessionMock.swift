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
    dataStub: Data? = .none,
    responseStub: URLResponse? = .none,
    errorStub: ServerError? = .none
  ) {
    self.dataStub = dataStub
    self.responseStub = responseStub
    self.errorStub = errorStub
  }

  private func getStubDataAndResponse() throws -> (Data, URLResponse) {
    guard errorStub == .none,
          let dataStub,
          let responseStub
    else { throw errorStub ?? .requestFails }
    return (dataStub, responseStub)
  }

  // Protocol requirements
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse) {
    try getStubDataAndResponse()
  }

  func data(from url: URL) async throws -> (Data, URLResponse) {
    try getStubDataAndResponse()
  }
}
