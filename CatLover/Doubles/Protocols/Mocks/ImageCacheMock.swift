//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ImageCacheMock: ImageCacheProtocol {

  // Mock values
  var writtenDataStub: [String: Data] = [:]
  var dataStub: Data?

  // Protocol requirements
  func write(_ data: Data, name: String) async throws {
    writtenDataStub[name] = data
  }

  func read(name: String) async throws -> Data {
    writtenDataStub[name] ?? Data()
  }
}
