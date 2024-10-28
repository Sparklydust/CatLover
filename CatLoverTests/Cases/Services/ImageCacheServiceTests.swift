//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

@Suite(.serialized)
final class ImageCacheServiceTests: BaseTestCase, @unchecked Sendable {

  var sut: ImageCacheService!

  override init() {
    super.init()
    sut = ImageCacheService()
  }

  deinit {
    sut = .none
  }
}
