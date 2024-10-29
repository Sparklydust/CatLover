//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final class ImageCacheDummy: ImageCacheProtocol {

  // Protocol requirements
  func write(_ data: Data, name: String) async throws {
    // Intentionally empty
  }

  func read(name: String) async throws -> Data {
    Data()
  }
}
