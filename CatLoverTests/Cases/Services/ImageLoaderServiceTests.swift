//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Testing
@testable import CatLover

@Suite(.serialized)
final class ImageLoaderServiceTests: BaseTestCase, @unchecked Sendable {

  var sut: ImageLoaderService!

  override init() {
    super.init()
    sut = ImageLoaderService()
  }

  deinit {
    sut = .none
  }
}
