//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

/// Add ``URLSessionProtocol`` on top of ``URLSession`` to reduce the dependency for testing.
extension URLSession: URLSessionProtocol {
  // Intentionally empty
}

/// Acts as an abstraction on top of ``URLSession`` to reduce the dependency for testing and enable
/// injection through the ``Injected`` factory container.
protocol URLSessionProtocol {

  /// Retrieves the contents of a URL and delivers the data asynchronously.
  ///
  /// Use this method to wait until the session finishes transferring data and receive it in a single
  /// Data instance. To process the bytes as the session receives them, use bytes(for:delegate:).
  /// - Parameters:
  ///   - request: A URL request object that provides request-specific information such as the
  /// URL, cache policy, request type, and body data or body stream.
  ///   - delegate: A delegate that receives life cycle and authentication challenge callbacks as the
  ///   transfer progresses.
  /// - Returns: An asynchronously-delivered tuple that contains the URL contents as a Data instance,
  /// and a URLResponse.
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse)
}

extension URLSessionProtocol {

  /// Retrieves the contents of a URL and delivers the data asynchronously.
  ///
  /// Use this method to wait until the session finishes transferring data and receive it in a single
  /// Data instance.
  /// - Parameter request: A URL request object that provides request-specific information such as the
  /// URL, cache policy, request type, and body data or body stream.
  /// - Returns: An asynchronously-delivered tuple that contains the URL contents as a Data instance,
  /// and a URLResponse.
  func data(for request: URLRequest) async throws -> (Data, URLResponse) {
    try await data(for: request, delegate: .none)
  }
}
