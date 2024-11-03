//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ImageCacheMock: ImageCacheProtocol, @unchecked Sendable {

  // Mock values
  var dataStub: [String: Data] = [:]

  enum ImageCacheMockError: Error {
    case invalidData
  }

  // Protocol requirements
  func write(_ data: Data, name: String) async throws {
    dataStub[name] = data
  }

  func read(name: String) async throws -> Data {
    guard let data = dataStub[name]
    else { throw ImageCacheMockError.invalidData }
    return data
  }
}
