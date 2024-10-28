//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

class BaseTestCase: @unchecked Sendable {

  var serverDummy: ServerDummy!
  var urlSessionDummy: URLSessionDummy!

  var serverMock: ServerMock!
  var urlSessionMock: URLSessionMock!

  var serverSpy: ServerSpy!
  var urlSessionSpy: URLSessionSpy!

  init() {
    setupDoubles()
    setUpFactoryContainers()
  }

  deinit {
    tearDownDoubles()
  }
}

extension BaseTestCase {

  /// Setup the doubles present in the project to add them within a Factory Container when needed
  /// in unit tests.
  private func setupDoubles() {
    serverDummy = ServerDummy()
    urlSessionDummy = URLSessionDummy()

    serverMock = ServerMock(urlSessionMock: urlSessionDummy)
    urlSessionMock = URLSessionMock()

    serverSpy = ServerSpy()
    urlSessionSpy = URLSessionSpy()
  }

  /// Registers dummy instances for various protocol in the shared ``Factory`` container .
  ///
  /// This method sets up the dependency injection containers with predefined dummy instances.
  /// It is used for testing purposes to ensure that mock implementations are used instead
  /// of real services.
  private func setUpFactoryContainers() {
    Container.shared.urlSession.register { self.urlSessionDummy }
    Container.shared.server.register { self.serverDummy }
  }

  /// Clear all doubles present in the project.
  private func tearDownDoubles() {
    serverDummy = .none
    urlSessionDummy = .none

    serverMock = .none
    urlSessionMock = .none

    serverSpy = .none
    urlSessionSpy = .none
  }
}
