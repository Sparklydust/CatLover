//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation
import Testing
@testable import CatLover

struct TestTool {

  /// Mock ``ServerService`` with all needed parameters to create a fake api call response
  /// for ``ServerMock``.
  /// ```swift
  /// // example with success data.
  /// serverMock = try serverMock(data: .breedData)
  /// Container.shared.server.register { self.serverMock }
  ///
  /// // example with error data.
  /// serverMock = try serverMock(error: .requestFails)
  /// Container.shared.server.register { self.serverMock }
  /// ```
  /// - Parameters:
  ///   - data: The fake data that is expected to come back from the fake api call for tests, found
  ///   in the `JsonFileName.swift` file as a result of the fake api call.
  ///   - error: A optional ``ServerMock`` object if needed to test an error from an api response.
  ///   - file: The file where the test fails.
  ///   - line: The line of code where the test fails.
  /// - Returns: A fake ``ServerMock`` to initialized a Factory ``ServerService`` object for faking
  /// api call response during unit tests.
  static func serverMock(
    data: JsonFileName? = .none,
    error: ServerError? = .none,
    file: StaticString = #filePath,
    line: UInt = #line
  ) throws -> ServerMock {

    let urlSessionMock = try urlSessionMock(
      data: data,
      error: error,
      file: file,
      line: line
    )
    return ServerMock(urlSessionMock: urlSessionMock)
  }

  /// Mock ``URLSession`` with all needed parameters to create a fake api call response for
  /// ``URLSessionMock``.
  /// - Parameters:
  ///   - data: The fake data that is expected to come back from the fake api call for tests, found in
  ///   the `JsonFileName.swift` file as a result of the fake api call.
  ///   - error: A optional ``ServerError`` object if needed to test an error from an api response.
  ///   - file: The file where the test fails.
  ///   - line: The line of code where the test fails.
  /// - Returns: A fake ``URLSessionMock`` to initialized a `urlSessionMock` object for faking api call
  /// response during unit tests.
  static func urlSessionMock(
    data: JsonFileName? = .none,
    error: ServerError? = .none,
    file: StaticString = #filePath,
    line: UInt = #line
  ) throws -> URLSessionMock {

    var dataResponse: Data? = .none
    if let data {
      dataResponse = try ResourceLoader.jsonFake(data)
    }
    let response = HTTPURLResponse(
      url: URL(string: "https://fake.api.request.com")!,
      statusCode: 200,
      httpVersion: .none,
      headerFields: .none
    )!

    return URLSessionMock(data: dataResponse, response: response, error: error)
  }
}
