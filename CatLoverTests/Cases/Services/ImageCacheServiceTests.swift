//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Foundation
import Testing
@testable import CatLover

@Suite(.serialized)
final class ImageCacheServiceTests: BaseTestCase, @unchecked Sendable {

  var sut: ImageCacheService!

  override init() {
    super.init()
    sut = ImageCacheService(storageMode: .inMemory)
  }

  deinit {
    sut = .none
  }

  @Test func writeImageIsSuccessful_imageIsReadFromMemory() async throws {
    Container.shared.fileManager.register { self.fileManagerMock }
    sut = ImageCacheService(storageMode: .inMemory)
    let imageKeyFake = "ImageKeyFake"
    let expected = try #require("TestImage".data(using: .utf8))
    try await sut.write(expected, name: imageKeyFake)

    let result = try await sut.read(name: imageKeyFake)

    #expect(result == expected)
  }

  @Test func readUnknownImage_errorIsThrown() async throws {
    Container.shared.fileManager.register { self.fileManagerMock }
    sut = ImageCacheService(storageMode: .inMemory)

    await #expect(throws: (any Error).self) {
      _ = try await sut.read(name: "unknown_image_key")
    }
  }
}
