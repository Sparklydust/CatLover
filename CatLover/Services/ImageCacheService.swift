//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Foundation

final actor ImageCacheService: ImageCacheProtocol {
  // Intentionally empty
}

// MARK: - ImageCacheProtocol
extension ImageCacheService {

  func write(_ data: Data, name: String) async throws {
    // Intentionally empty
  }

  func read(name: String) async throws -> Data {
    Data()
  }
}
