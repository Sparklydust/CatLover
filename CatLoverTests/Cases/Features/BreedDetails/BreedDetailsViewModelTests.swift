//
// Copyright © 2024 and confidential to CatLover. All rights reserved.
//

import Factory
import Testing
@testable import CatLover

@Suite(.serialized)
final class BreedDetailsViewModelTests: BaseTestCase, @unchecked Sendable {

  var sut: BreedDetailsViewModel!

  override init() {
    super.init()
    sut = BreedDetailsViewModel()
  }

  deinit {
    sut = .none
  }
}
