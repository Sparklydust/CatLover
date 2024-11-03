//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
import UIKit
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
    let imageKeyFake = "TestImageKey"
    let imageDataFake = try #require(UIImage(systemName: "circle")?.jpegData(compressionQuality: 1.0))
    try await sut.write(imageDataFake, name: imageKeyFake)

    let result = try await sut.read(name: imageKeyFake).isEmpty

    #expect(result == false)
  }

  @Test func readUnknownImage_errorIsThrown() async throws {
    Container.shared.fileManager.register { self.fileManagerMock }
    sut = ImageCacheService(storageMode: .inMemory)

    await #expect(throws: (any Error).self) {
      _ = try await sut.read(name: "unknown_image_key")
    }
  }
}
