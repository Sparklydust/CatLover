//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class URLSessionSpy: URLSessionProtocol, @unchecked Sendable {

  // Spy values
  var isDataRequestCalled = false
  var isDataURLCalled = false
  var dataRequestCount: Int = .zero
  var dataURLCount: Int = .zero
  var request: URLRequest?
  var delegate: (any URLSessionTaskDelegate)?
  var url: URL?

  // Protocol requirements
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse) {
    isDataRequestCalled = true
    dataRequestCount += 1
    self.request = request
    self.delegate = delegate
    return (Data(), URLResponse())
  }

  func data(from url: URL) async throws -> (Data, URLResponse) {
    isDataURLCalled = true
    dataURLCount += 1
    self.url = url
    return (Data(), URLResponse())
  }
}
