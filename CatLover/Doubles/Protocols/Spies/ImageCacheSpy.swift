//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ImageCacheSpy: ImageCacheProtocol {

  // Spy values
  var isWriteCalled = false
  var isReadCalled = false
  var isClearInMemoryCalled = false
  var writeCount: Int = .zero
  var readCount: Int = .zero
  var clearInMemoryCount: Int = .zero
  var data: Data?
  var name: String?

  enum ImageCacheSpyError: Error {
    case invalidData
  }

  // Protocol requirements
  func write(_ data: Data, name: String) async throws {
    isWriteCalled = true
    writeCount += 1
    self.data = data
    self.name = name
  }

  func read(name: String) async throws -> Data {
    isReadCalled = true
    readCount += 1
    self.name = name
    guard let data else { throw ImageCacheSpyError.invalidData }
    return data
  }
}
