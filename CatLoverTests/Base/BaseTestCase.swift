//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

class BaseTestCase: @unchecked Sendable {

  var fileManagerDummy: FileManagerDummy!
  var imageCacheDummy: ImageCacheDummy!
  var imageLoaderDummy: ImageLoaderDummy!
  var serverDummy: ServerDummy!
  var urlSessionDummy: URLSessionDummy!

  var fileManagerMock: FileManagerMock!
  var imageCacheMock: ImageCacheMock!
  var imageLoaderMock: ImageLoaderMock!
  var serverMock: ServerMock!
  var urlSessionMock: URLSessionMock!

  var fileManagerSpy: FileManagerSpy!
  var imageCacheSpy: ImageCacheSpy!
  var imageLoaderSpy: ImageLoaderSpy!
  var serverSpy: ServerSpy!
  var urlSessionSpy: URLSessionSpy!

  init() {
    setupDoubles()
    setUpFactoryContainers()
    setUpEntities()
  }

  deinit {
    tearDownDoubles()
    tearDownEntities()
  }
}

// MARK: - Doubles
extension BaseTestCase {

  /// Setup the doubles present in the project to add them within a Factory Container when needed
  /// in unit tests.
  private func setupDoubles() {
    fileManagerDummy = FileManagerDummy()
    imageCacheDummy = ImageCacheDummy()
    imageLoaderDummy = ImageLoaderDummy()
    serverDummy = ServerDummy()
    urlSessionDummy = URLSessionDummy()

    fileManagerMock = FileManagerMock()
    imageCacheMock = ImageCacheMock()
    imageLoaderMock = ImageLoaderMock()
    serverMock = ServerMock(urlSessionMock: urlSessionDummy)
    urlSessionMock = URLSessionMock()

    fileManagerSpy = FileManagerSpy()
    imageCacheSpy = ImageCacheSpy()
    imageLoaderSpy = ImageLoaderSpy()
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
    Container.shared.imageLoader.register { self.imageLoaderDummy }
    Container.shared.urlSession.register { self.urlSessionDummy }
    Container.shared.server.register { self.serverDummy }
  }

  /// Clear all doubles present in the project.
  private func tearDownDoubles() {
    serverDummy = .none
    urlSessionDummy = .none
    fileManagerDummy = .none
    imageLoaderDummy = .none
    imageCacheDummy = .none

    serverMock = .none
    urlSessionMock = .none
    fileManagerMock = .none
    imageLoaderMock = .none
    imageCacheMock = .none

    serverSpy = .none
    urlSessionSpy = .none
    fileManagerSpy = .none
    imageLoaderSpy = .none
    imageCacheSpy = .none
  }
}

// MARK: - Entities
extension BaseTestCase {

  /// Sets up SwiftData entities for in-memory data, ensuring that no data is persisted during tests.
  private func setUpEntities() {
    Task { @MainActor in
      BreedEntity.internalFakeContext = BreedEntity.fakeContext()
      BreedImageEntity.internalFakeContext = BreedEntity.fakeContext()
    }
  }

  /// Clears all in-memory entity contexts after tests are completed.
  private func tearDownEntities() {
    Task { @MainActor in
      BreedEntity.internalFakeContext = .none
      BreedImageEntity.internalFakeContext = .none
    }
  }
}
