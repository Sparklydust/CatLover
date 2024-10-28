//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

/// Add ``URLSessionProtocol`` on top of ``URLSession`` to reduce the dependency for testing.
extension URLSession: URLSessionProtocol {
  // Intentionally empty
}

/// Nods the head on top of ``URLSession`` to reduce the dependency for testing and insert
/// it in the ``Injected`` Factor container.
protocol URLSessionProtocol {

  /// Retrieves the contents of a URL and delivers the data asynchronously.
  ///
  /// Use this method to wait until the session finishes transferring data and receive it in a single
  /// Data instance. To process the bytes as the session receives them, use bytes(for:delegate:).
  /// - Parameters:
  ///   - url: The URL to retrieve.
  ///   - delegate: A delegate that receives life cycle and authentication challenge callbacks as the
  ///   transfer progresses.
  /// - Returns: An asynchronously-delivered tuple that contains the URL contents as a Data instance,
  /// and a URLResponse.
  func data(
    from url: URL,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse)
}

extension URLSessionProtocol {

  /// Retrieves the contents of a URL and delivers the data asynchronously.
  ///
  /// Use this method to wait until the session finishes transferring data and receive it in a single
  /// Data instance.
  /// - Parameter url: The URL to retrieve.
  /// - Returns: An asynchronously-delivered tuple that contains the URL contents as a Data instance,
  /// and a URLResponse.
  func data(from url: URL) async throws -> (Data, URLResponse) {
    try await data(from: url, delegate: .none)
  }
}
