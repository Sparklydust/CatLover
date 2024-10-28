//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class URLSessionSpy: URLSessionProtocol {

  // Spy values
  var isDataCalled = false
  var dataCount: Int = .zero
  var request: URLRequest?
  var delegate: (any URLSessionTaskDelegate)?

  // Protocol requirements
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse) {
    isDataCalled = true
    dataCount += 1

    self.request = request
    self.delegate = delegate
    return (Data(), URLResponse())
  }
}
