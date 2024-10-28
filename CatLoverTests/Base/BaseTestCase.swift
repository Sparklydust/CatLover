//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

class BaseTestCase: @unchecked Sendable {

  var fileManagerDummy: FileManagerDummy!
  var imageCacheDummy: ImageCacheDummy!
  var serverDummy: ServerDummy!
  var urlSessionDummy: URLSessionDummy!

  var fileManagerMock: FileManagerMock!
  var imageCacheMock: ImageCacheMock!
  var serverMock: ServerMock!
  var urlSessionMock: URLSessionMock!

  var fileManagerSpy: FileManagerSpy!
  var imageCachesSpy: ImageCacheSpy!
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
    fileManagerSpy = FileManagerSpy()
    imageCacheDummy = ImageCacheDummy()
    serverDummy = ServerDummy()
    urlSessionDummy = URLSessionDummy()

    fileManagerMock = FileManagerMock()
    imageCacheMock = ImageCacheMock()
    serverMock = ServerMock(urlSessionMock: urlSessionDummy)
    urlSessionMock = URLSessionMock()

    fileManagerSpy = FileManagerSpy()
    imageCachesSpy = ImageCacheSpy()
    serverSpy = ServerSpy()
    urlSessionSpy = URLSessionSpy()
  }

  /// Registers dummy instances for various protocol in the shared ``Factory`` container .
  ///
  /// This method sets up the dependency injection containers with predefined dummy instances.
  /// It is used for testing purposes to ensure that mock implementations are used instead
  /// of real services.
  private func setUpFactoryContainers() {
    Container.shared.reset()
    Container.shared.fileManager.register { self.fileManagerDummy }
    Container.shared.imageCache.register { self.imageCacheDummy }
    Container.shared.urlSession.register { self.urlSessionDummy }
    Container.shared.server.register { self.serverDummy }
  }

  /// Clear all doubles present in the project.
  private func tearDownDoubles() {
    serverDummy = .none
    urlSessionDummy = .none
    imageCacheDummy = .none
    fileManagerDummy = .none

    serverMock = .none
    urlSessionMock = .none
    imageCacheMock = .none
    fileManagerMock = .none

    serverSpy = .none
    urlSessionSpy = .none
    imageCachesSpy = .none
    fileManagerSpy = .none
  }
}
